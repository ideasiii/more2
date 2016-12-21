/**
 * This module is for MORE project.
 */
package sdk.ideas;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

import java.io.File;

/**
 * @author Jugo #2
 */
public class More
{
    public final static int MORE_ERR_SUCCESS = 1;
    public final static int MORE_ERR_FAIL = 0;
    public final static int MORE_ERR_EXCEPTION = -1;
    public final static int MORE_ERR_INVALID_PARAMETER = -2;
    public final static int MORE_ERR_MEMBER_EXIST = -3;

    public class Common
    {
	final public static String UPLOAD_FILE_PATH = "/uploadfile";
	final public static String DB_PATH_IDEAS = "/data/sqlite/ideas.db";
	final public static String DB_PATH_MORE_MEMBER = "/data/sqlite/more_member.db";
	final public static String PATH_DOWNLOAD_LIB_ANDROID = "/ideas/sdk/download/libs/android";
	final public static String PATH_DOWNLOAD_LIB_IOS = "/ideas/sdk/download/libs/ios";
	final public static String PATH_DOWNLOAD_DOC_ANDROID = "/ideas/sdk/download/doc/android";
	final public static String PATH_DOWNLOAD_DOC_IOS = "/ideas/sdk/download/doc/ios";

	/** sqlite Common **/
	final public static String CREATE_DATE = "create_date";

	/**
	 * sqlite more_mamber.db table: more_mamber
	 **/
	final public static String MEMBER_ID = "member_id";
	final public static String MEMBER_EMAIL = "member_email";
	final public static String MEMBER_PASSWORD = "member_password";
	final public static String MEMBER_NAME = "member_name";
	final public static String MEMBER_COMPANY = "member_company";
	final public static String MEMBER_PHONE = "member_phone";
	final public static String MEMBER_TOKEN = "member_token";
	final public static String MEMBER_AUTH_STATE = "member_auth_state";
	final public static String MEMBER_GROUP = "member_group";
	final public static String MEMBER_STATE = "member_state";
	final public static String START_DATE = "start_date";
	final public static String END_DATE = "end_date";

	/**
	 * sqlite ideas.db table: app
	 **/
	final public static String APP_ID = "app_id";
	final public static String APP_NAME = "app_name";
	final public static String APP_CATEGORY = "app_category";
	final public static String APP_DESC = "app_description";
	final public static String APP_ICON = "app_icon";
	final public static String APP_OS = "app_os";
	final public static String USER_TOKEN = "user_token";
	final public static String USER_NAME = "user_name";
	final public static String USER_EMAIL = "user_email";
	final public static String USER_PHONE = "user_phone";

	/**
	 * sqlite ideas.db table: sdk
	 **/
	final public static String SDK_ID = "sdk_id";
	final public static String SDK_OS = "sdk_os";
	final public static String SDK_OWNER = "sdk_owner";
	final public static String SDK_NAME = "sdk_name";
	final public static String SDK_DESC = "sdk_desc";
	final public static String SDK_FILE = "sdk_file";
	final public static String SDK_DOC = "sdk_doc";

	final public static String APP_EDIT = "app_edit";
    }

    final public static ArrayList<String> listAppField = new ArrayList<>(Arrays.asList(Common.APP_ID, Common.APP_NAME, Common.APP_CATEGORY, Common.APP_DESC, Common.APP_ICON,
	    Common.APP_OS, Common.USER_TOKEN, Common.USER_NAME, Common.USER_EMAIL, Common.USER_PHONE));

    final public static ArrayList<String> listSdkField = new ArrayList<>(
	    Arrays.asList(Common.SDK_ID, Common.SDK_OS, Common.SDK_OWNER, Common.SDK_NAME, Common.SDK_DESC, Common.SDK_FILE, Common.SDK_DOC, Common.CREATE_DATE));

    public static class MemberData
    {
	public int member_id;
	public String member_email;
	public String member_password;
	public String member_name;
	public String member_company;
	public String member_phone;
	public String member_token;
	public int member_auth_state;
	public int member_group;
	public String create_date;
    }

    public static class SdkData
    {
	public String sdk_id;
	public String sdk_os;
	public String sdk_owner;
	public String sdk_name;
	public String sdk_desc;
	public String sdk_file;
	public String sdk_doc;
	public String create_date;
    }

    public static class AppData
    {
	public String app_id;
	public String app_name;
	public String app_category;
	public String app_description;
	public String app_icon;
	public String app_os;
	public String user_token;
	public String user_name;
	public String user_email;
	public String user_phone;
	public String create_date;
    }

    public More()
    {

    }

    public int queryMemberAccountList(HttpServletRequest request, ArrayList<String> listEmailAccount)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);
	    String strSQL = "select member_email from more_member;";

	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    while (rs.next())
	    {
		++nCount;
		listEmailAccount.add(rs.getString("member_email"));
	    }
	    rs.close();
	    stat.close();
	    con.close();
	    sqlite = null;
	    More.webTracker(request, "queryMemberAccountList success: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryMemberAccountList failed: ", e.toString());
	}

	return nCount;
    }

    public int queryMember(HttpServletRequest request, final String strEmail, MemberData memData)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);
	    String strSQL = "select * from more_member where member_email = '" + strEmail + "';";

	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    while (rs.next())
	    {
		++nCount;
		memData.member_id = rs.getInt("member_id");
		memData.member_email = rs.getString("member_email");
		memData.member_password = rs.getString("member_password");
		memData.member_name = rs.getString("member_name");
		memData.member_company = rs.getString("member_company");
		memData.member_phone = rs.getString("member_phone");
		memData.member_token = rs.getString("member_token");
		memData.member_auth_state = rs.getInt("member_auth_state");
		memData.member_group = rs.getInt("member_group");
		memData.create_date = rs.getString("create_date");

	    }
	    rs.close();
	    stat.close();
	    con.close();
	    sqlite = null;
	    More.webTracker(request, "queryMember failed: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryMember failed: ", e.toString());
	}

	return nCount;
    }

    public int memberAdd(HttpServletRequest request, final String strEmail, final String strPassword, final String strName, final String strCompany, final String strPhone,
	    final String strToken)
    {
	if (!StringUtility.isValid(strEmail) || !StringUtility.isValid(strPassword))
	{
	    return MORE_ERR_INVALID_PARAMETER;
	}

	try
	{
	    MemberData memData = new MemberData();
	    int nCount = queryMember(request, strEmail, memData);
	    if (0 < nCount)
		return MORE_ERR_MEMBER_EXIST;

	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);

	    String sql = "insert into more_member(member_email,member_password,member_name,member_company,member_phone,member_token) values ( ?,?,?,?,?,?)";

	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;
	    pst.setString(idx++, strEmail);
	    pst.setString(idx++, strPassword);
	    pst.setString(idx++, strName);
	    pst.setString(idx++, strCompany);
	    pst.setString(idx++, strPhone);
	    pst.setString(idx++, strToken);
	    pst.executeUpdate();
	    pst.close();
	    con.close();
	    sqlite = null;

	    More.webTracker(request, "memberAdd success: ", sql);

	}
	catch (Exception e)
	{

	    More.webTracker(request, "memberAdd failed: ", e.toString());
	    return MORE_ERR_EXCEPTION;
	}

	return MORE_ERR_SUCCESS;
    }

    public synchronized String generateToken(String msg, boolean timeChange)
    {
	long current = System.currentTimeMillis();
	try
	{
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    md.update(msg.getBytes());
	    if (timeChange)
	    {
		byte now[] = (new Long(current)).toString().getBytes();
		md.update(now);
	    }
	    return toHex(md.digest());
	}
	catch (NoSuchAlgorithmException e)
	{

	}

	return String.valueOf(current);
    }

    private String toHex(byte buffer[])
    {
	StringBuffer sb = new StringBuffer(buffer.length * 2);
	for (int i = 0; i < buffer.length; i++)
	{
	    sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));
	    sb.append(Character.forDigit(buffer[i] & 15, 16));
	}

	return sb.toString();
    }

    public int querySdk(HttpServletRequest request, ArrayList<SdkData> listSdk)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);
	    String strSQL = "select * from sdk order by create_date;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(con, strSQL, listSdkField, listData);
	    con.close();
	    sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		SdkData sdkData = null;
		while (it.hasNext())
		{
		    sdkData = new SdkData();
		    mapItem = it.next();
		    sdkData.sdk_id = mapItem.get(Common.SDK_ID);
		    sdkData.sdk_os = mapItem.get(Common.SDK_OS);
		    sdkData.sdk_owner = mapItem.get(Common.SDK_OWNER);
		    sdkData.sdk_name = mapItem.get(Common.SDK_NAME);
		    sdkData.sdk_desc = mapItem.getOrDefault(Common.SDK_DESC, "No Description");
		    sdkData.sdk_file = mapItem.get(Common.SDK_FILE);
		    sdkData.sdk_doc = mapItem.getOrDefault(Common.SDK_DOC, "");
		    sdkData.create_date = mapItem.get(Common.CREATE_DATE);
		    listSdk.add(sdkData);
		    sdkData = null;
		}
		nCount = listSdk.size();
	    }
	    More.webTracker(request, "querySdk success: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "querySdk failed: ", e.toString());
	}

	return nCount;
    }

    public void SendingEmail(HttpServletRequest request, String Email, String Body)
    {
	try
	{
	    String host = "smtp.gmail.com";
	    String from = "louis.ju.tw@gmail.com"; // Your mail id
	    String pass = "Immortal-666"; // Your Password
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.ssl.trust", host);
	    String[] to = { Email }; // To Email address
	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    message.setFrom(new InternetAddress(from));
	    InternetAddress[] toAddress = new InternetAddress[to.length];
	    // To get the array of addresses
	    for (int i = 0; i < to.length; i++)
	    { // changed from a while loop
		toAddress[i] = new InternetAddress(to[i]);
	    }
	    System.out.println(Message.RecipientType.TO);
	    for (int j = 0; j < toAddress.length; j++)
	    { // changed from a while
	      // loop
		message.addRecipient(Message.RecipientType.TO, toAddress[j]);
	    }
	    message.setSubject("Email from MORE");

	    message.setContent(Body, "text/html");
	    Transport transport = session.getTransport("smtp");
	    transport.connect(host, from, pass);
	    transport.sendMessage(message, message.getAllRecipients());
	    transport.close();
	    More.webTracker(request, "MORE SendingEmail success: " + Email, null);
	}
	catch (Exception e)
	{
	    System.out.println("MORE Send Mail Exception:" + e.toString());
	    More.webTracker(request, "MORE SendingEmail failed: ", e.toString());
	}
    }

    public int queryApp(HttpServletRequest request, ArrayList<AppData> listApp, String strUserToken)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);
	    String strSQL = "select * from app where user_token = '" + strUserToken + "' order by create_date;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(con, strSQL, listAppField, listData);
	    con.close();
	    sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		AppData appData = null;
		while (it.hasNext())
		{
		    appData = new AppData();
		    mapItem = it.next();
		    appData.app_id = mapItem.get(Common.APP_ID);
		    appData.app_name = mapItem.get(Common.APP_NAME);
		    appData.app_category = mapItem.get(Common.APP_CATEGORY);
		    appData.app_description = mapItem.get(Common.APP_DESC);
		    appData.app_icon = mapItem.get(Common.APP_ICON);
		    appData.app_os = mapItem.get(Common.APP_OS);
		    appData.user_token = mapItem.get(Common.USER_TOKEN);
		    appData.user_name = mapItem.get(Common.USER_NAME);
		    appData.user_email = mapItem.get(Common.USER_EMAIL);
		    appData.user_phone = mapItem.get(Common.USER_PHONE);
		    appData.create_date = mapItem.get(Common.CREATE_DATE);
		    listApp.add(appData);
		    appData = null;
		}
		nCount = listApp.size();
	    }
	    More.webTracker(request, "queryApp success: ", strSQL);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryApp failed: ", e.toString());
	}
	return nCount;
    }

    public void deleteApp(HttpServletRequest request, final String strAppId)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    // Query APP Icon File Path
	    String strSQL = "select app_icon from app where app_id = '" + strAppId + "'";
	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    String strAppIcon = null;
	    if (rs.next())
	    {
		strAppIcon = rs.getString("app_icon");
	    }
	    rs.close();
	    stat.close();

	    // Delete DB data
	    strSQL = "delete from app where app_id = ?";
	    PreparedStatement pst = null;
	    pst = con.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();
	    con.close();
	    sqlite = null;

	    // Delete local file
	    if (null != strAppIcon)
	    {
		File file = new File("/data/opt/tomcat/webapp/more" + strAppIcon);
		if (null != file)
		{

		    String absolutePath = file.getAbsolutePath();
		    String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

		    if (file.delete())
		    {
			System.out.println(file.getName() + " is deleted!");
			More.webTracker(request, file.getName() + "deleteApp success: ", strSQL);
		    }
		    else
		    {
			System.out.println("Delete operation is failed.");
			More.webTracker(request, "[Delete operation is failed.] deleteApp failed: ", strSQL);
		    }

		    File folderPath = new File(filePath);

		    if (folderPath.isDirectory())
		    {

			if (folderPath.list().length <= 0)
			{

			    System.out.println("Directory is empty!");
			    More.webTracker(request, "[Directory is empty!] deleteApp failed: ", strSQL);
			    folderPath.delete();
			}
		    }
		}
	    }

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "deleteApp failed: ", e.toString());
	}
    }

    public void updateApp(HttpServletRequest request, final String strAppId, final String strAppIcon, final String strAppName, final String strAppOs, final String strAppCategory,
	    final String strAppDesc)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    String sql = null;
	    if (null == strAppIcon)
	    {
		sql = "update app set app_name = ? , app_os = ? , app_category = ? , app_description = ? where app_id = ?";
	    }
	    else
	    {
		sql = "update app set app_icon = ?, app_name = ? , app_os = ? , app_category = ? , app_description = ? where app_id = ?";
	    }

	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;

	    if (null != strAppIcon)
	    {
		pst.setString(idx++, strAppIcon);
	    }
	    pst.setString(idx++, strAppName);
	    pst.setString(idx++, strAppOs);
	    pst.setString(idx++, strAppCategory);
	    pst.setString(idx++, strAppDesc);
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();

	    con.close();
	    sqlite = null;
	    More.webTracker(request, "updateApp success: ", sql);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "updateApp failed: ", e.toString());
	}
    }

    public void updateUser(HttpServletRequest request, final String strAppId, final String strUserName, final String strUserPhone, final String strUserEmail)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    String sql = "update app set user_name = ? , user_phone = ? , user_email = ? where app_id = ?";
	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;
	    pst.setString(idx++, strUserName);
	    pst.setString(idx++, strUserPhone);
	    pst.setString(idx++, strUserEmail);
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();

	    con.close();
	    sqlite = null;
	    More.webTracker(request, "updateUser success: ", sql);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "updateUser failed: ", e.toString());
	}
    }

    static public String getClientIP(HttpServletRequest request)
    {
	String ip = request.getHeader("X-Forwarded-For");
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("HTTP_CLIENT_IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getRemoteAddr();
	}
	return ip;
    }

    static public String getDateTime()
    {
	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date current = new Date();
	return sdFormat.format(current);
    }

    @SuppressWarnings("deprecation")
    static public int insert(String strIP, int nPort, final String strDB, final String strCollection, final HashMap<String, String> mapData)
    {
	int nResult = 0;

	if (null == mapData || 0 >= mapData.size())
	    return -1;

	try
	{
	    MongoClient mongo = new MongoClient(strIP, nPort);
	    // get database
	    // if database doesn't exists, mongodb will create it for you
	    DB db = mongo.getDB(strDB);

	    // get collection
	    // if collection doesn't exists, mongodb will create it for you
	    DBCollection collection = db.getCollection(strCollection);

	    /**** Insert ****/
	    // create a document to store key and value

	    BasicDBObject document = new BasicDBObject();

	    for (Object key : mapData.keySet())
	    {
		document.append((String) key, mapData.get(key));
	    }
	    collection.insert(document);
	    if (null != mongo)
		mongo.close();

	}
	catch (Exception e)
	{
	    nResult = -1;
	    System.out.println("Mongo Exception: " + e.toString());
	}
	return nResult;
    }

    static public void webTracker(HttpServletRequest request, String strAction, String strEvent)
    {
	HashMap<String, String> mapData = new HashMap<String, String>();
	mapData.put("client", getClientIP(request));
	mapData.put("host", request.getRequestURL().toString());
	mapData.put("create_date", getDateTime());
	mapData.put("action", strAction);
	mapData.put("event", strEvent);
	insert("127.0.0.1", 27017, "website", "more", mapData);
	mapData.clear();
    }

    static public String rhex(byte num)
    {
	String hex_chr = "0123456789abcdef";
	String str = "";

	for (int j = 0; j <= 3; j++)
	{
	    str += hex_chr.charAt((num >> (j * 8 + 4)) & 0x0F) + hex_chr.charAt((num >> (j * 8)) & 0x0F);

	}
	return str;
    }

    static public int[] str2blks_MD5(String str)
    {
	int nblk = ((str.length() + 8) >> 6) + 1;
	int []blks;
	blks = new int[nblk * 16];
	for (int i = 0; i < str.length(); i++)
	{
	    blks[i >> 2] |= str.charAt(i) << ((i % 4) * 8);
	    blks[i >> 2] |= 0x80 << ((i % 4) * 8);
	    blks[nblk * 16 - 2] = str.length() * 8;
	}
	 return blks;
    }

    static public int add(int x, int y)
    {
	int lsw = (x & 0xFFFF) + (y & 0xFFFF);
	int msw = (x >> 16) + (y >> 16) + (lsw >> 16);
	return (msw << 16) | (lsw & 0xFFFF);
    }
    
    static public int rol(int num, int cnt)
    {
	return (num << cnt) | (num >>> (32 - cnt));
    }
    
    static public int cmn(int q, int a, int b, int x, int s, int t)
    {
	return add(rol(add(add(a, q), add(x, t)), s), b);
    }
    
    static public int ff(int a, int b, int c, int d, int x, int s, int t)
    {
	return cmn((b & c) | ((~b) & d), a, b, x, s, t);
    }
    
    static public int gg(int a, int b, int c, int d, int x, int s, int t)
    {
	return cmn((b & d) | (c & (~d)), a, b, x, s, t);
    }
    
    static public int hh(int a, int b, int c, int d, int x, int s, int t)
    {
	return cmn(b ^ c ^ d, a, b, x, s, t);
    }
    
    static public int ii(int a, int b, int c, int d, int x, int s, int t)
    {
	return cmn(c ^ (b | (~d)), a, b, x, s, t);
    }
    
    static public String calcMD5(String str)
    {
	 int[] x = str2blks_MD5(str);
	 byte a =  (byte) 1732584193;
	 byte b = (byte) -271733879;
	 byte c = (byte) -1732584194;
	 byte d =  (byte) 271733878;
	 
	 for(int i = 0; i < x.length; i += 16)
	  {
	    int olda = a;
	    int oldb = b;
	    int oldc = c;
	    int oldd = d;
	    
	    a = (byte) ff(a, b, c, d, x[i+ 0], 7 , -680876936);
	    d = (byte) ff(d, a, b, c, x[i+ 1], 12, -389564586);
	    c = (byte) ff(c, d, a, b, x[i+ 2], 17,  606105819);
	    b = (byte) ff(b, c, d, a, x[i+ 3], 22, -1044525330);
	    a = (byte) ff(a, b, c, d, x[i+ 4], 7 , -176418897);
	    d = (byte) ff(d, a, b, c, x[i+ 5], 12,  1200080426);
	    c = (byte) ff(c, d, a, b, x[i+ 6], 17, -1473231341);
	    b = (byte) ff(b, c, d, a, x[i+ 7], 22, -45705983);
	    a = (byte) ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
	    d = (byte) ff(d, a, b, c, x[i+ 9], 12, -1958414417);
	    c = (byte) ff(c, d, a, b, x[i+10], 17, -42063);
	    b = (byte) ff(b, c, d, a, x[i+11], 22, -1990404162);
	    a = (byte) ff(a, b, c, d, x[i+12], 7 ,  1804603682);
	    d = (byte) ff(d, a, b, c, x[i+13], 12, -40341101);
	    c = (byte) ff(c, d, a, b, x[i+14], 17, -1502002290);
	    b = (byte) ff(b, c, d, a, x[i+15], 22,  1236535329);    

	    a = (byte) gg(a, b, c, d, x[i+ 1], 5 , -165796510);
	    d = (byte) gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
	    c = (byte) gg(c, d, a, b, x[i+11], 14,  643717713);
	    b = (byte) gg(b, c, d, a, x[i+ 0], 20, -373897302);
	    a = (byte) gg(a, b, c, d, x[i+ 5], 5 , -701558691);
	    d = (byte) gg(d, a, b, c, x[i+10], 9 ,  38016083);
	    c = (byte) gg(c, d, a, b, x[i+15], 14, -660478335);
	    b = (byte) gg(b, c, d, a, x[i+ 4], 20, -405537848);
	    a = (byte) gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
	    d = (byte) gg(d, a, b, c, x[i+14], 9 , -1019803690);
	    c = (byte) gg(c, d, a, b, x[i+ 3], 14, -187363961);
	    b = (byte) gg(b, c, d, a, x[i+ 8], 20,  1163531501);
	    a = (byte) gg(a, b, c, d, x[i+13], 5 , -1444681467);
	    d = (byte) gg(d, a, b, c, x[i+ 2], 9 , -51403784);
	    c = (byte) gg(c, d, a, b, x[i+ 7], 14,  1735328473);
	    b = (byte) gg(b, c, d, a, x[i+12], 20, -1926607734);
	    
	    a = (byte) hh(a, b, c, d, x[i+ 5], 4 , -378558);
	    d = (byte) hh(d, a, b, c, x[i+ 8], 11, -2022574463);
	    c = (byte) hh(c, d, a, b, x[i+11], 16,  1839030562);
	    b = (byte) hh(b, c, d, a, x[i+14], 23, -35309556);
	    a = (byte) hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
	    d = (byte) hh(d, a, b, c, x[i+ 4], 11,  1272893353);
	    c = (byte) hh(c, d, a, b, x[i+ 7], 16, -155497632);
	    b = (byte) hh(b, c, d, a, x[i+10], 23, -1094730640);
	    a = (byte) hh(a, b, c, d, x[i+13], 4 ,  681279174);
	    d = (byte) hh(d, a, b, c, x[i+ 0], 11, -358537222);
	    c = (byte) hh(c, d, a, b, x[i+ 3], 16, -722521979);
	    b = (byte) hh(b, c, d, a, x[i+ 6], 23,  76029189);
	    a = (byte) hh(a, b, c, d, x[i+ 9], 4 , -640364487);
	    d = (byte) hh(d, a, b, c, x[i+12], 11, -421815835);
	    c = (byte) hh(c, d, a, b, x[i+15], 16,  530742520);
	    b = (byte) hh(b, c, d, a, x[i+ 2], 23, -995338651);

	    a = (byte) ii(a, b, c, d, x[i+ 0], 6 , -198630844);
	    d = (byte) ii(d, a, b, c, x[i+ 7], 10,  1126891415);
	    c = (byte) ii(c, d, a, b, x[i+14], 15, -1416354905);
	    b = (byte) ii(b, c, d, a, x[i+ 5], 21, -57434055);
	    a = (byte) ii(a, b, c, d, x[i+12], 6 ,  1700485571);
	    d = (byte) ii(d, a, b, c, x[i+ 3], 10, -1894986606);
	    c = (byte) ii(c, d, a, b, x[i+10], 15, -1051523);
	    b = (byte) ii(b, c, d, a, x[i+ 1], 21, -2054922799);
	    a = (byte) ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
	    d = (byte) ii(d, a, b, c, x[i+15], 10, -30611744);
	    c = (byte) ii(c, d, a, b, x[i+ 6], 15, -1560198380);
	    b = (byte) ii(b, c, d, a, x[i+13], 21,  1309151649);
	    a = (byte) ii(a, b, c, d, x[i+ 4], 6 , -145523070);
	    d = (byte) ii(d, a, b, c, x[i+11], 10, -1120210379);
	    c = (byte) ii(c, d, a, b, x[i+ 2], 15,  718787259);
	    b = (byte) ii(b, c, d, a, x[i+ 9], 21, -343485551);
	    
	    a = (byte) add(a, olda);
	    b = (byte) add(b, oldb);
	    c = (byte) add(c, oldc);
	    d = (byte) add(d, oldd);
	  }
	 return rhex(a) + rhex(b) + rhex(c) + rhex(d);
    }
    
    
}
