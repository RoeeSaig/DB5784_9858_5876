
[General]
Version=1

[Preferences]
Username=
Password=2584
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##HR
Name=EMPLOYEE
Count=1000

[Record]
Name=EMPLOYEEID
Type=NUMBER
Size=
Data=Sequence(1, [Inc], [WithinParent])
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=50
Data=FirstName + LastName
Master=

[Record]
Name=PHONENUMBER
Type=VARCHAR2
Size=20
Data='05' + Random(0, 9)+ '-' + Random(100, 999) + '-' + Random(1000, 9999)
Master=

[Record]
Name=STARTWORK
Type=DATE
Size=
Data=Random('01-01-2000', '04-07-2024')
Master=

[Record]
Name=SALARY
Type=NUMBER
Size=
Data=Random(6000, 12000)
Master=

[Record]
Name=WORKINGHOURS
Type=NUMBER
Size=
Data=Random(5, 12)
Master=

[Record]
Name=DEPTID
Type=NUMBER
Size=
Data=Random(1, 742)
Master=

