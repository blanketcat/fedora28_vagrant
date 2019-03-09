
# Add mount points to fstab
/etc/fstab:
  file.append:
    - text:
      - //file-server/share01/ /data/share01 cifs vers=3.0,noauto,sec=krb5i,multiuser,file_mode=0770,dir_mode=0770,nounix,noserverino
      - //file-server/share02/ /data/share02 cifs vers=3.0,noauto,sec=krb5i,multiuser,file_mode=0770,dir_mode=0770,nounix,noserverino
      - //file-server/home/ /data/homes cifs vers=3.0,noauto,sec=krb5i,multiuser,file_mode=0770,dir_mode=0770,nounix,noserverino