

/**
 * ExchService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.7.8  Built on : May 19, 2018 (07:06:11 BST)
 */

    package com.jtsjhj.webservice;

    /*
     *  ExchService java interface
     */

    public interface ExchService {
          

        /**
          * Auto generated method signature
          * 
                    * @param extractData0
                
         */

         
                     public com.jtsjhj.webservice.ExtractDataResponse extractData(

                        com.jtsjhj.webservice.ExtractData extractData0)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * 
                * @param extractData0
            
          */
        public void startextractData(

            com.jtsjhj.webservice.ExtractData extractData0,

            final com.jtsjhj.webservice.ExchServiceCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        /**
          * Auto generated method signature
          * 
                    * @param receiveData2
                
         */

         
                     public com.jtsjhj.webservice.ReceiveDataResponse receiveData(

                        com.jtsjhj.webservice.ReceiveData receiveData2)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * 
                * @param receiveData2
            
          */
        public void startreceiveData(

            com.jtsjhj.webservice.ReceiveData receiveData2,

            final com.jtsjhj.webservice.ExchServiceCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        /**
          * Auto generated method signature
          * 
                    * @param login4
                
         */

         
                     public com.jtsjhj.webservice.LoginResponse login(

                        com.jtsjhj.webservice.Login login4)
                        throws java.rmi.RemoteException
             ;

        
         /**
            * Auto generated method signature for Asynchronous Invocations
            * 
                * @param login4
            
          */
        public void startlogin(

            com.jtsjhj.webservice.Login login4,

            final com.jtsjhj.webservice.ExchServiceCallbackHandler callback)

            throws java.rmi.RemoteException;

     

        
       //
       }
    