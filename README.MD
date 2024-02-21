# Email Task

### Task

write a bash script that sends you and email.

## Process

I installed ssmtp with is the service I am using to send the email.

```
sudo apt install ssmtp
```

I then configured my ssmtp with my email client , gmail and email adress using vim.

```
sudo vim /etc/ssmtp/ssmtp.conf
```

My configuration file.

```
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=projectarrow80@gmail.com


# The place where the mail goes. The actual machine name is required no
# MX records are consulted. Commonly mailhosts are named mail.domain.com
mailhub=smtp.gmail.com:587

AuthUser=projectarrow80@gmail.com
AuthPass=byauostddvqkdsqx
UseTLS=YES
UseSTARTTLS=YES

# Where will the mail seem to come from?
rewriteDomain=gmail.com

# The full hostname
hostname=Githuba.

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
-- INSERT --
```

I created a bash file sendEmail.sh to write my bash script.

```
vim sendEmail.sh
```

How to run:

- Clone the repo and have it on your local machine

```
git clone https://github.com/githubarj/Email_Task.git
```

- Make sure your current directory is the one of the repo

```
cd Email_Task
```

- Ensure that the file has excecutable permissions.

```
chomd u+x sendEmail.sh
```

- Run the script.

```
./sendEmail
```
Follow the prompts and click enter when done, will load a bit and send. 
### Note: The email might go to spam depending on your organisation's email policy.
