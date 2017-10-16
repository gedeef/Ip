@isTest
private class TestIpAddress{
	@isTest 
	static void testConstructor() {
		IpAddress ip = new IpAddress('10.1.2.3');

		System.assertEquals(ip.asLong(), 3 + 2*255 + 255*255+ 10*255*255*255);
		System.assertEquals('10.1.2.3', ip.asString());
	}
	
	@isTest static void testHexConverter() {
		IpAddress ip = new IpAddress('10.0.15.254');
		System.assertEquals(ip.asHexString(), '0A.00.0F.FE');
	}
	

	@isTest static void testIsInRange(){
		IpAddress ip = new IpAddress('192.168.10.11');
		System.assert(ip.isInRange(new IpAddress('192.168.0.0'), new IpAddress('192.168.255.255'))); //true
		ip = new IpAddress('10.0.0.1');
		System.assert(ip.isInRange(new IpAddress('192.168.0.0'), new IpAddress('192.168.255.255'))==false); //false
	}
}
