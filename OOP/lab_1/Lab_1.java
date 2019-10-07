import java.util.Scanner;
class Lab_1 {
    public static void main(String[] args) {
        int data_leng = 5;
        double data[] = input_m(data_leng);
        double result_l[][];
        result_l = new double[data_leng - 1][4];
        for(int i=0; i<data_leng-1; i++){
          result_l[i][0] = data[i];
          result_l[i][1] = data[i+1];
          result_l[i][2] = Lab_1.first(data[i],data[i+1]);
          result_l[i][3] = Lab_1.second(data[i],data[i+1]);
        }
        for (double[] l_name:result_l){
          String pattern_s = "результат работы первой функции со значениями %f и %f = %f";
          String result = String.format(pattern_s, l_name[0], l_name[1], l_name[2]);
          System.out.println(result);
          pattern_s = "результат работы второй функции со значениями %f и %f = %f";
          result = String.format(pattern_s, l_name[0], l_name[1], l_name[3]);
          System.out.println(result);
        }
    }
    public static double first(double a, double b){
        double result = Math.pow((Math.cos(a) - Math.cos(b)),2) - Math.pow((Math.sin(a) - Math.sin(b)),2);
        return result;
    }
    public static double second(double a, double b){
        double result = -4*Math.pow(Math.sin((a-b)/2),2)*Math.cos(a+b);
        return result;
    }
    public static double[] input_m(int data_leng){
        double data[];
        data = new double[data_leng];
        int i = 0;
        Scanner in = new Scanner(System.in);
        while(i<5){
          System.out.print("Input a number: ");
          double num = in.nextDouble();
          data[i] = num;
          i+=1;
        }
        System.out.print("Error\nPlease, enter again: ");
        i = 0;
        do{
          System.out.print("Input a number: ");
          double num = in.nextDouble();
          data[i] = num;
          i+=1;
        } while(i<5);
        return data;
    }
}
