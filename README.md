# AES-Basys3
Implementation of a detracted form of the Advanced Encryption System (AES) on the  Digilent Basys-3 FPGA using the Rijndael S-Box Algorithm.

## Algorithm Used

[**Rijndael Algorithm**](https://www.techtarget.com/searchsecurity/definition/Rijndael)

The full AES process is based on this algorithm and it involves a total of 11 rounds with the following transformations: 
-SubBytes
-ShiftRows
-MixColumns
-AddRoundKey

For this project, instead of a full 128-bit AES block, limited by 16 input switch we are going to implement it on the **16-bit block** causing us to negate the *MixColumn* stage of encryption due to obvious reasons. 

## Breakdown of the Modules

The entire Project has been divided into 4 subsequent parts, namely:
1.**Input**
  -Input is taken on the FPGA using the slide switches which translate to a 4-digit hex message.
  -The message is stored inside a 16-bit register called the Data Register. 
  -This register is also used to display the message on a Seven Segment Display
2.**Encryption/Decryption**
  -By pressing the mode button, the user can move from the input mode to encryption mode. The message stored in the Data Register undergoes the encryption algorithm.
  -The output of the algorithm is an encrypted message which is again stored in the Data Register while the cipher key generated is stored in the key register.
  -The seven-segment display now displays the encrypted message.
3.**Pass Check**
  -Upon encryption, control is sent to the passcode check block which acts as another step of security. The screen prompts the user to input a password.
  -A 4-bit password is inputted using the push buttons on the FPGA board.
  -The password is matched with a predefined pattern stored in the Pass register.
  -An incorrect password locks the user for 2 seconds.
4. **Output**
   -Incorrect password displays "----" on the SSD.
  -Only upon correct entry of the password would the decryption cycle start.
  -The message stored in the Data register is decrypted.
  -Decrypted Output is then shown on the Seven Segment Display.
  
## References

To fully understand AES and how we can go about implementing the same on FPGA, we went through multiple research papers and videos online.
- [Digilent Basys-3 Reference Manual](https://digilent.com/reference/_media/basys3:basys3_rm.pdf)
- Pranesh Prakash & Japreet Grewal, [“ How India Regulates Encryption”](https://eprint.iacr.org/2016/789) 
- [Máire McLoone and J.V McCanny, "High Performance Single-Chip FPGA Rijndael Algorithm Implementations" Ç.K. Koç, D. Naccache, and C. Paar (Eds.): CHES 2001, LNCS 2162, pp. 65–76, 2001.](https://link.springer.com/content/pdf/10.1007/3-540-44709-1_7.pdf)
- [Kirat Pal Singh, Shiwani Dod, “An Efficient Hardware Design and Implementation of Advanced Encryption Standard (AES) Algorithm”](https://eprint.iacr.org/2016/789.pdf)
- [T. Jamil, "The Rijndael algorithm," in IEEE Potentials, vol. 23, no. 2, pp. 36-38, April-May 2004, DOI: 10.1109/MP.2004.1289996.](https://ieeexplore.ieee.org/document/1289996)
