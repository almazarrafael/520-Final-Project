/************************************************************************/
/*                                                                      */
/*      UDPEchoClient                                                   */
/*                                                                      */
/*      A chipKIT DEWFcK UDP Client application to                      */
/*      demonstrate how to use the UdpClient Class.                     */
/*      This can be used in conjuction  with UDPEchoServer              */            
/*                                                                      */
/************************************************************************/
/*        Author:         Keith Vogel                                   */
/*        Copyright 2014, Digilent Inc.                                 */
/************************************************************************/
/* 
*
* Copyright (c) 2013-2014, Digilent <www.digilentinc.com>
* Contact Digilent for the latest version.
*
* This program is free software; distributed under the terms of 
* BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1.    Redistributions of source code must retain the above copyright notice, this
*        list of conditions and the following disclaimer.
* 2.    Redistributions in binary form must reproduce the above copyright notice,
*        this list of conditions and the following disclaimer in the documentation
*        and/or other materials provided with the distribution.
* 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
*        of its contributors may be used to endorse or promote products derived
*        from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*    5/14/2014(KeithV): Created                                       */
/*                                                                      */
/************************************************************************/

/************************************************************************/
/*                       Supported hardware:                            */
/*                                                                      */
/*  uC32 with a WiFiShield                                              */
/*  WF32                                                                */
/*  WiFIRE                                                              */
/*                                                                      */
/************************************************************************/

//******************************************************************************************
//******************************************************************************************
//***************************** SET YOUR CONFIGURATION *************************************
//******************************************************************************************
//******************************************************************************************

/************************************************************************/
/*                                                                      */
/*              Include ONLY 1 hardware library that matches            */
/*              the network hardware you are using                      */
/*                                                                      */
/*              Refer to the hardware library header file               */
/*              for supported boards and hardware configurations        */
/*                                                                      */
/************************************************************************/
#include <MRF24G.h>                     // This is for the MRF24WGxx on a pmodWiFi or WiFiShield

/************************************************************************/
/*                    Required libraries, Do NOT comment out            */
/************************************************************************/
#include <DEIPcK.h>
#include <DEWFcK.h>

/************************************************************************/
/*                                                                      */
/*              SET THESE VALUES FOR YOUR NETWORK                       */
/*                                                                      */
/************************************************************************/

const char * szIPServer = "192.168.1.180";    // server to connect to
uint16_t portServer = DEIPcK::iPersonalPorts44 + 400;     // port 44400

// Specify the SSID
const char * szSsid = "chipKIT";

// select 1 for the security you want, or none for no security
#define USE_WPA2_PASSPHRASE
//#define USE_WPA2_KEY
//#define USE_WEP40
//#define USE_WEP104
//#define USE_WF_CONFIG_H

// modify the security key to what you have.
#if defined(USE_WPA2_PASSPHRASE)

    const char * szPassPhrase = "Digilent";
    #define WiFiConnectMacro() deIPcK.wfConnect(szSsid, szPassPhrase, &status)

#elif defined(USE_WPA2_KEY)

    WPA2KEY key = { 0x27, 0x2C, 0x89, 0xCC, 0xE9, 0x56, 0x31, 0x1E, 
                    0x3B, 0xAD, 0x79, 0xF7, 0x1D, 0xC4, 0xB9, 0x05, 
                    0x7A, 0x34, 0x4C, 0x3E, 0xB5, 0xFA, 0x38, 0xC2, 
                    0x0F, 0x0A, 0xB0, 0x90, 0xDC, 0x62, 0xAD, 0x58 };
    #define WiFiConnectMacro() deIPcK.wfConnect(szSsid, key, &status)

#elif defined(USE_WEP40)

    const int iWEPKey = 0;
    WEP40KEY keySet = { 0xBE, 0xC9, 0x58, 0x06, 0x97,     // Key 0
                        0x00, 0x00, 0x00, 0x00, 0x00,     // Key 1
                        0x00, 0x00, 0x00, 0x00, 0x00,     // Key 2
                        0x00, 0x00, 0x00, 0x00, 0x00 };   // Key 3
    #define WiFiConnectMacro() deIPcK.wfConnect(szSsid, keySet, iWEPKey, &status)

#elif defined(USE_WEP104)

    const int iWEPKey = 0;
    WEP104KEY keySet = { 0x3E, 0xCD, 0x30, 0xB2, 0x55, 0x2D, 0x3C, 0x50, 0x52, 0x71, 0xE8, 0x83, 0x91,   // Key 0
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   // Key 1
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,   // Key 2
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }; // Key 3
    #define WiFiConnectMacro() deIPcK.wfConnect(szSsid, keySet, iWEPKey, &status)

#elif defined(USE_WF_CONFIG_H)

    #define WiFiConnectMacro() deIPcK.wfConnect(0, &status)

#else   // no security - OPEN

    #define WiFiConnectMacro() deIPcK.wfConnect(szSsid, &status)

#endif
   
//******************************************************************************************
//******************************************************************************************
//***************************** END OF CONFIGURATION ***************************************
//******************************************************************************************
//******************************************************************************************

typedef enum
{
    NONE = 0,
    CONNECT,
    RESOLVEENDPOINT,
    WRITE,
    READ,
    CLOSE,
    DONE,
} STATE;

STATE state = CONNECT;

unsigned tStart = 0;
unsigned tWait = 5000;

// must have a datagram cache
UDPSocket udpClient;

// our sketch datagram buffer
byte rgbRead[1024];

IPSTATUS    status = ipsSuccess;
IPEndPoint  epRemote;

// this is for udpClient.writeDatagram to write
byte rgbWriteDatagram[] = {'*','W','r','o','t','e',' ','f','r','o','m',' ','u','d','p','C','l','i','e','n','t','.','w','r','i','t','e','D','a','t','a','g','r','a','m','*','\n'};
int cbWriteDatagram = sizeof(rgbWriteDatagram);

/***      void setup()
 *
 *      Parameters:
 *          None
 *              
 *      Return Values:
 *          None
 *
 *      Description: 
 *      
 *      Arduino setup function.
 *      
 *      Initialize the Serial Monitor, and initializes the
 *      connection to the UDPEchoServer
 *      Use DHCP to get the IP, mask, and gateway
 *      by default we connect to port 44400
 *      
 * ------------------------------------------------------------ */
void setup() {
  
    Serial.begin(9600);
    Serial.println("UDPEchoClient 3.0");
    Serial.println("Digilent, Copyright 2014");
    Serial.println("");
}

/***      void loop()
 *
 *      Parameters:
 *          None
 *              
 *      Return Values:
 *          None
 *
 *      Description: 
 *      
 *      Arduino loop function.
 *      
 *      We are using the default timeout values for the DNETck and UdpClient class
 *      which usually is enough time for the Udp functions to complete on their first call.
 *
 *      This code will write a sting to the server and have the server echo it back
 *      Remember, UDP is unreliable, so the server may not echo back if the datagram is lost
 *      
 * ------------------------------------------------------------ */
void loop() {
    int cbRead = 0;

    switch(state)
    {

        case CONNECT:
            if(WiFiConnectMacro())
            {
                Serial.println("WiFi connected");
                deIPcK.begin();
                state = RESOLVEENDPOINT;
            }
            else if(IsIPStatusAnError(status))
            {
                Serial.print("Unable to connection, status: ");
                Serial.println(status, DEC);
                state = CLOSE;
            }
            break;

        case RESOLVEENDPOINT:
            if(deIPcK.resolveEndPoint(szIPServer, portServer, epRemote, &status))
            {
                if(deIPcK.udpSetEndPoint(epRemote, udpClient, portDynamicallyAssign, &status))
                {
                    state = WRITE;
                }
            }

            // alway check the status and get out on error
            if(IsIPStatusAnError(status))
            {
                Serial.print("Unable to resolve endpoint, error: 0x");
                Serial.println(status, HEX);
                state = CLOSE;
            }
            break;

       // write out the strings  
       case WRITE:
            if(deIPcK.isIPReady(&status))
            {
                Serial.println("Writing out Datagram");
  
                udpClient.writeDatagram(rgbWriteDatagram, cbWriteDatagram);

                Serial.println("Waiting to see if a datagram comes back:");
                state = READ;
                tStart = (unsigned) millis();
            }
            else if(IsIPStatusAnError(status))
            {
                Serial.print("Lost the network, error: 0x");
                Serial.println(status, HEX);
                state = CLOSE;
            }
            break;

        // look for the echo back
         case READ:

            // see if we got anything to read
            if((cbRead = udpClient.available()) > 0)
            {

                cbRead = cbRead < (int) sizeof(rgbRead) ? cbRead : sizeof(rgbRead);
                cbRead = udpClient.readDatagram(rgbRead, cbRead);
 
                for(int i=0; i < cbRead; i++) 
                {
                    Serial.print((char) rgbRead[i]);
                }

                // give us some more time to wait for stuff to come back
                tStart = (unsigned) millis();
            }

            // give us some time to get everything echo'ed back
            // or if the datagram is never echoed back
            else if( (((unsigned) millis()) - tStart) > tWait )
            {
                Serial.println("Done waiting, assuming nothing more is coming");
                Serial.println("");
                state = CLOSE;
            }
            break;

        // done, so close up the tcpClient
        case CLOSE:
            udpClient.close();
            Serial.println("Closing udpClient, Done with sketch.");
            state = DONE;
            break;

        case DONE:
        default:
            break;
    }

    // keep the stack alive each pass through the loop()
    DEIPcK::periodicTasks();
}

