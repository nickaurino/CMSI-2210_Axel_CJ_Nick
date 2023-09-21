import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;

public class NATO {
    public static void main(String[] args) {
        String s = "abcdefghijklmnopqrstuvwxyz";
        ArrayList<String> nato = new ArrayList<String>(Arrays.asList("ALPHA","BETA","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET","KILO","LIMA","MIKE","NOVEMBER","OSCAR","PAPA","QUEBEC","ROMEO","SIERRA","TANGO","UNIFORM","VICTOR","WISKEY","X-RAY","YANKEE","ZULU"));
        ArrayList<String> morse = new ArrayList<String>(Arrays.asList(".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."));
        Scanner myScanner = new Scanner(System.in);
        System.out.println("Enter a String to be converted");
        String line = myScanner.nextLine();

        String natoSave = "";
        String morseSave = "";

        //This algorithm is O(n^2)
        //Iterates through your searched line (O(n))
        //Checks for the character at index (O(1))
        //Finds index of that letter in the alphabet (O(n)) (This could be done more efficiently with a hasmap, mapping each letter to its index in the alphabet, but you would have to add to the map which takes memory)
        //Finds corresponding nato and morse in list by index (O(1))
        //Final: O(N^2)
        for(int i=0; i<line.length(); i++) {
            String stringAt = String.valueOf(line.toLowerCase().charAt(i));
            int index = s.indexOf(stringAt);
            natoSave += nato.get(index) + "\n";
            morseSave += morse.get(index) + "\n";
        }

        System.out.println(line + "to NATO is: \n" + natoSave);
        System.out.println(line + " to morse code is: \n" + morseSave);
        myScanner.close();
    }
}