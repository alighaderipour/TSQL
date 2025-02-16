print('Welcome To Bank Management Project')
from register import *
while True:
    try:
        register = int(input("1. SignUP\n"
                              "2. SignIn\n"))
        if register ==1 or register == 2:
            if register == 1 :
                SignUP()
                #create_user()
            else:
                SignIn()

        else:
            print('Please Choose Either 1 or 2 ')        
    except ValueError:
        print('Invalid Entry, Please Enter a Number')
test