package com.bank;
import java.io.File;
import java.util.Calendar;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public aspect Logger {
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    java.util.Date fecha = new Date();
	    BufferedWriter bw;
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success1() : call(void moneyMakeTransaction() );
	    after() : success1() {
	    	try {
	            if (!file.exists()) {
	                file.createNewFile();
	            }
	            FileWriter fw = new FileWriter(file,true);
	            BufferedWriter bw = new BufferedWriter(fw);
	            System.out.println("Realizar Transaccion " + fecha);
	            bw.write("Realizar Transaccion " + fecha + " \n");
	            bw.close();
	    	
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    pointcut success2() : call(void moneyWithdrawal() );
	    after() : success2() {
	    	try {
	            if (!file.exists()) {
	                file.createNewFile();
	            }
	            FileWriter fw = new FileWriter(file,true);
	            BufferedWriter bw = new BufferedWriter(fw);
	            
	            System.out.println("Retirar Dinero " + fecha);
	            bw.write("Retirar Dinero " + fecha + " \n");
	            bw.close();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	    
	}

