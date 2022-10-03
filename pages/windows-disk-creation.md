# Windows Disk Creation 

Snippets of code for creating either an SSD Install from a existing USB Disk 

or even creating one 

First lets create the disk / this can be a partition on the SSD or a flash drive

```
diskpart
list disk (look at the flash drive number)
select disk flash_number
clean
create partition primary
select partition 1
active
format quick fs=fat32 
assign
exit
```

and to copy the stuff (this will create a MBR install disk) for UEFT + GPT installation you'll have to copy the /efi folder as well 

```
xcopy I:\*.* F:\ /e /f /h 
```