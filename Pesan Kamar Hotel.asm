
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.code
org 100h  

    start:
        jmp mulai 
         
       nama           db 13,10,' Nama Anda   : $'
       lanjut         db 13,10,'LANJUT TEKAN (Y) =  $'
       tampung_nama   db 30,?,30 dup(?)  
       masukkan       db 13,10,'Masukkan Pilihan Kamar: $'
      
daftar db 13,10,' _______________________________________'
       db 13,10,'                                        '
       db 13,10,' +***   DAFTAR PESAN KAMAR HOTEL    ***+'
       db 13,10,' _______________________________________'
       db 13,10,' #                                     #'
       db 13,10,' # NO|        TIPE KAMAR               #'
       db 13,10,' #_____________________________________#' 
       db 13,10,' #                                     #'
       db 13,10,' # 1.| SINGEL ROOM - Rp.250.000        #'
       db 13,10,' #_____________________________________#' 
       db 13,10,' #                                     #'
       db 13,10,' # 2.| DELUXE ROOM - Rp.370.000        #'
       db 13,10,' #_____________________________________#'
       db 13,10,' #                                     #'
       db 13,10,' # 3.| SUITE ROOM - Rp.520.000         #'
       db 13,10,' #_____________________________________#'
       db 13,10,' #                                     #'
       db 13,10,' # 4.| FAMILY ROOM - Rp.780.000        #'
       db 13,10,' #_____________________________________#'
       db 13,10,' #                                     #'
       db 13,10,' # 5.| PRESIDEN SUITE - Rp.1.400.000   #'
       db 13,10,' #_____________________________________#','$'
    mulai:                                  
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx  
        
        mov ah,09h
	    mov dx,offset daftar
	    int 21h
	    mov ah,09h
	    mov dx,offset lanjut
	    int 21h
	    mov ah,01h
	    int 21h
	    cmp al,'y'
	    jmp proses
	    jne error_msg
error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h
proses:
        mov ah,09h
        mov dx,offset masukkan 
        int 21h
        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1
        
        cmp al,'2'
        je hasil2
        
        cmp al,'3'
        je hasil3
        
        cmp al,'4'
        je hasil4
        
        cmp al,'5'
        je hasil5   
        
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h
	
hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h  
hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
       
;-----------------------------------------------------------------------------------------
teks1  db 13,10,' '
       db 13,10,'Anda memilih No. 1 Tipe Kamar SINGEL ROOM'
       db 13,10,'Harga Tipe Kamar SINGEL ROOM : Rp.250.000'
       db 13,10,'Terima Kasih Telah Memesan Kamar Ini Semoga Suka Yaa $'
teks2  db 13,10,' '
       db 13,10,'Anda memilih No. 2 Tipe Kamar DELUXE ROOM'
       db 13,10,'Harga Tipe Kamar DELUXE ROOM : Rp.370.000'
       db 13,10,'Terima Kasih Telah Memesan Kamar Ini Semoga Suka Yaa $'
teks3  db 13,10,' '
       db 13,10,'Anda memilih No 3 Tipe Kamar SUITE ROOM'
       db 13,10,'Harga Tipe Kamar SUITE ROOM : Rp.520.000'
       db 13,10,'Terima Kasih Telah Memesan Kamar Ini Semoga Suka Yaa $'
teks4  db 13,10,' '
       db 13,10,'Anda memilih No 4 adalah Sholat MAGHRIB'  
       db 13,10,'Waktu Sholat MAGHRIB : 17:45 WIB'
       db 13,10,'Terima Kasih Semoga Menjalankan Ibadah Dengan Khusyuk $'
teks5  db 13,10,' '
       db 13,10,'Anda memilih No 5 adalah Sholat ISYA'
       db 13,10,'Waktu Sholat ISYA : 19:01 WIB'
       db 13,10,'Terima Kasih Semoga Menjalankan Ibadah Dengan Khusyuk $'

ret




