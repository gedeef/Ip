public class IpAddress{
    private String sIp; //ip as string
    private Double dIp; //ip as double
    
    /* @todo Doubles should be longs */

    //returns a double from the string 'a.b.c.d' ip representation
    private Double ipFromString(){
        String[] elts = sIp.split('\\.');
        return      Double.valueOf(elts[0]) * Math.pow(255, 3) + 
                    Double.valueOf(elts[1]) * Math.pow(255, 2) +
                    Double.valueOf(elts[2]) * Math.pow(255, 1) + //=*255
                    Double.valueOf(elts[3]) * Math.pow(255, 0);  //=*1 
    }

    //Constructor
    public IpAddress(String ip){
        //check 'a.b.c.d' format here ?
        sIp = ip;
        dIp = this.ipFromString();
    }

    public Double asDouble(){
        return dIp;
    }
    
    public String asString(){
      return sIp;
    }
    
    public String asHexString(){
      String[] elts = sIp.split('\\.');
      String hexIp = '';
      for (String elt:elts){
        if (hexIp != '') hexIp+= '.';
        hexIp += ('0' + longToHex((Long) elt)).right(2);
      }
      return hexIp;
    }
    
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
    
    public Boolean isInRange(IpAddress lowBoundary, IpAddress highBoundary){
        return (this.asDouble() >= lowBoundary.asDouble()) && (this.asDouble() <= highBoundary.asDouble());
    }
}
