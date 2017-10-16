public class IpAddress{
    private String sIp; //ip as string
    private Long lIp; //ip as Long
    
    //returns a Long from the string 'a.b.c.d' ip representation
    private Long ipFromString(){
        String[] elts = sIp.split('\\.');
        return      Long.valueOf(elts[0]) * Math.pow(255, 3) + 
                    Long.valueOf(elts[1]) * Math.pow(255, 2) +
                    Long.valueOf(elts[2]) * Math.pow(255, 1) + //=*255
                    Long.valueOf(elts[3]) * Math.pow(255, 0);  //=*1 
    }

    //Constructor
    public IpAddress(String ip){
        //check 'a.b.c.d' format here ?
        sIp = ip;
        lIp = this.ipFromString();
    }

    public Long asLong(){
        return dIp;
    }
    
    public String asString(){
      return sIp;
    }
    
    //return Ip address as a 'g.h.i.j' string with g, h, i , j hex numbers : format [\da-f]{2}
    // from a.b.c.d string with a, b, c, d integers in range [0,255]
    public String asHexString(){
      String[] elts = sIp.split('\\.');
      String hexIp = '';
      for (String elt:elts){
        if (hexIp != '') hexIp+= '.';
        hexIp += ('0' + longToHex((Long) elt)).right(2);
      }
      return hexIp;
    }
    
    //return the long value of the ip
    public String longToHex( Long num ){
      List<String> symbols = '0123456789ABCDEF'.split('');
      String hex = ''; 
      while (true) { 
        hex = symbols[(Integer)Math.mod((num), 16)] + hex; 
        if (Math.floor(num/16)==0) break; 
        num = Math.floor(num/16); 
      }
      return hex;
    }
    
    //returns wether the ip is in range given by its boundaries specified as arguments
    public Boolean isInRange(IpAddress lowBoundary, IpAddress highBoundary){
        return (this.aLong() >= lowBoundary.asLong()) && (this.asLong() <= highBoundary.asLong());
    }
}
