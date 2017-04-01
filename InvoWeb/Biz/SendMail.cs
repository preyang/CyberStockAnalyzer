using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace Biz.SendMail
    {
    public class SendMail
        {
        public bool sendMail(string emailid, string body, string Subject)
            {


            // string body = "hidsf dfdsf  dsf ds";

            try
                {

                MailAddress fromAddress = new MailAddress("invowebstub2014@gmail.com");
                MailAddress toAddress = new MailAddress(emailid);
                string fromPassword = "jhd420420";



                SmtpClient smtp = new SmtpClient();
                //smtp.Host = "216.218.224.246"
                // smtp.Port = 465
                //smtp.Host = "ASPMX5.GOOGLEMAIL.COM"
                //smtp.Port = 465
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = new NetworkCredential(fromAddress.Address, fromPassword);
                smtp.EnableSsl = true;
                MailMessage message = new MailMessage(fromAddress, toAddress);

                message.Subject = Subject;
                message.IsBodyHtml = true;
                message.Body = body;
                message.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");
                smtp.Send(message);
                return true;
                }
            catch (Exception e)
                {
                return false;

                }
            }

        }
    }
