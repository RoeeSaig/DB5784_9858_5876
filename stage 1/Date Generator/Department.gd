
[General]
Version=1

[Preferences]
Username=
Password=2945
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##HR
Name=DEPARTMENT
Count=400..1000

[Record]
Name=DEPTID
Type=NUMBER
Size=
Data=Sequence(1, [Inc], [WithinParent]) + 0
Master=

[Record]
Name=DEPTNAME
Type=VARCHAR2
Size=50
Data=List('Electrical', 'Plumbing', 'HVAC', 'Carpentry', 'Painting', 'Landscaping', 'Appliance Repair', 'Roofing', 'Security Systems', 'Fire Safety')
Master=

[Record]
Name=BUDGET
Type=NUMBER
Size=
Data=Random(6000, 100000)
Master=

[Record]
Name=MAXCAPACITY
Type=NUMBER
Size=
Data=Random(10, 100)
Master=

[Record]
Name=CURRENTSIZE
Type=NUMBER
Size=
Data=Random(10, 100)
Master=

