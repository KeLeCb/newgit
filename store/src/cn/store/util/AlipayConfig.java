package cn.store.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *������AlipayConfig
 *���ܣ�����������
 *��ϸ�������ʻ��й���Ϣ������·��
 *�޸����ڣ�2019-04-05
 *˵����
 *���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 *�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���
 */

public class AlipayConfig {
	
//�����������������������������������Ļ�����Ϣ������������������������������

	// Ӧ��ID,����APPID���տ��˺ż�������APPID��Ӧ֧�����˺�
	public static String app_id = "2016092600601299";
	
	// �̻�˽Կ������PKCS8��ʽRSA2˽Կ
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDYfj7zmmtYdiEBO9SZZJamNhKbsOYq5nqZLugDWM+5l3k2kXXLJ3xk3q8THj2Xn9CyU4DuVVJibluek9+XrXOEkuY/fHT4UKC3OymNCUmmDeMi5X/R+dNVB4bSFnJK+h+7DWI0AmYt+MmjSgKF82rrXuPjvD9zOSega4Z7BCnUrsGnXHUhiiFBONXhlcSANFVsooDigQxeKQez/5l8cLl9Yp4sWFF6bKdtSE3gRnCokFhDX3BCm7rszaocG25JoNnhEsKDjrK20yCR6yZvfkTr+LHnsgtCnYzdr13ulx3fA8YAog7wQ3izwLGqG0QDQX/Wc7XfdUq6GUQzhS6rreTFAgMBAAECggEBANhjL0bLpNnRkOGrzK7ZVJ6jU2wcn6JnpkiwEqUtwsqtNTGuqH87Y2FrFrDUPBnuWmmzfx45V9QcnCTfhtATRXBQaCUyn7OG22zpjHl0vBFmtg2uOFlHDM1jbYVVfD2mzcpn8S0s7LasgdZdZjI/ADJsMPnysbTYftwgPVV97tWtU1x5grsF3d7yUn/yRvDe5xCEyQLgOXZA3nvzBTNmcLq2L3g3E8LWekaEt8sh7DoKbxRmTKPd+3xTwpN/mX2nUIuW6bRbIzcpNL5tvpW6pJv5kU8hCQKRDs0Hw0e9S9HfUh/b/XoaodE6wQeDAftbktC1tqc2JB3WPXKxOqO2V6ECgYEA+eQR7xzwa+CCVZq/4kCRig6Zj2+U0SUCad2k2SmFsG8zCYYgnyOCeH1MYKUvG/aW9tS7BPAhZ3shHx0zNNqLWvYoHfElZZ7Cqp9d5TsXxajerA7MGGz7rYkNi7N8U/qwwcIePObHe8ELMpfCj6Jm+z5tAJNrMyxh7L5G3pWsKu0CgYEA3ckoXK0Pgr/E0ZBpBC2YxDe/dQUxtUx0n4u+NjfGG3RDBtKkh4rROs1sv5S2d5s89377BMTkjvSSJeVn9emniGcpOttXSldutnS6h6x1zscc1OdGWF5TW3STICQJazqxVasx3cbPzi0vAYbgx1zJeFtC0jadtBmx74S5gqww7jkCgYAuZHgr4zyDWpf32pX7JC+g6Nr7dSS0u2E6VErRglLukYZxIzSVNtt3ERQH8ULQtzQJuS7LWOVqt8JLa3lhO52Zko+aF3Xw6suLL7EX6KOeL56/ZLPhaQJEkmgwYm8XjDgakLZaaiHoyMsSZnhZgDYMOOe1rqi9RGUdtamkkzb2dQKBgGMNsn8hs+m7aFYIXz7EdpQ8KcBD352PVg7jxMJGSq58UGs9rMn0j9npYYZ3Dr+Aj8wh5E6O+V13kcZnHPVRs8dR+7ITwHqtbf8DR0PNHJiLiS71VA+noScZe5RBRAumHQmb+huI7cqxl2rhKIchw8GDUOa+CdUkHLpS1t+rs/bRAoGBANQfldhNhGlUiTuhuDlSyrehOvauxyGWix5rdgnLTcSaYhUGB6e+VJUQhBWyUFAuzlrMT8FXjLvFR9zc1p5JJLAdSLe7e43Ly753D8S80pK4Zf7KvF8OS7NhGR5Aj/wFB4d2m2E7Nd5IjFC32LYyGI6c/35TXVt8gIh+dQBj9gHE";
	
	// ֧������Կ,�鿴��ַ��https://openhome.alipay.com/platform/keyManage.htm ��ӦAPPID�µ�֧������Կ��
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuWnbs82g8FbRYclC+DWzE3vV2aBjTyvYaGoVyLePuJSbXMWlAtdPvQI83FY7rxZrR3EBVNdPr0gOhOIiQWI9zacPSqbZ5iqIBUYSwBm5eermdy6mQTl5L4wDuT0U2UthVZFq5eBCTJayzifYPn1h0HCET3wwYus5ctoa6HTc3u0/WQr84kf3bHAFqSe+0MPAUCqU9nGa3GOyLh1BWR+ymwz+wvxIPW1Z6SqIF+kv/TAC+U8yLoL2cGCNJsypaedQ1bJgm075vLSplenGPPqOL/TNBq8y6gieMklgJ7BOFUyofjyOAVLyTs0dhXMfZO0kArKY0boU7h0fKYm6UvEhEQIDAQAB";

	// �������첽֪ͨҳ��·��  ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
	public static String notify_url = "http://localhost:8080/store/alipay/notify_url.jsp";

	// ҳ����תͬ��֪ͨҳ��·�� ��http://��ʽ������·�������ܼ�?id=123�����Զ����������������������������
	public static String return_url = "http://localhost:8080/store/alipay/return_url.jsp";

	// ǩ����ʽ
	public static String sign_type = "RSA2";
	
	// �ַ������ʽ
	public static String charset = "utf-8";
	
	// ֧�������� https://openapi.alipay.com/gateway.do
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// ֧��������
	public static String log_path = "F:\\SoftDev\\ALiPay\\log";


//�����������������������������������Ļ�����Ϣ������������������������������

    /** 
     * д��־��������ԣ�����վ����Ҳ���ԸĳɰѼ�¼�������ݿ⣩
     * @param sWord Ҫд����־����ı�����
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

/*	�̼��˺ţ�bsignj4847@sandbox.com
 * 	�̻�UID��2088102177362832
 *	��¼���룺111111
 *	�˻���� ��0.01
 * 
 * ����˺ţ�atfhwt9410@sandbox.com
 * ��¼���룺111111
 * ֧�����룺111111
 * �û����ƣ�ɳ�价��
 * ֤���������֤��(IDENTITY_CARD)
 * ֤�����룺259396192701040842
 *   �˻���99998.99
 * 
 * */

