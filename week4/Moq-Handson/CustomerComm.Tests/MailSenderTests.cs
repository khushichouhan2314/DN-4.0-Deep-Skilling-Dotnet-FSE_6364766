using System;

namespace CustomerCommLib
{
    public class CustomerComm
    {
        private readonly IMailSender _mailSender;

        public CustomerComm(IMailSender mailSender)
        {
            _mailSender = mailSender ?? throw new ArgumentNullException(nameof(mailSender));
        }

        public bool SendMailToCustomer()
        {

            return _mailSender.SendMail("abc@ab.com", "Some Message");
        }
    }
}
