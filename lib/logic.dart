String encrypt(String text, int shift){
  String encryptedText = "";
  var ascii = text.codeUnits;
  List<int> encrytped_ascii = [];
  ascii.forEach((int element)=>{
    if(element>96 && element<123){
      encrytped_ascii.add(((element + shift - 97) % 26) + 97)
    }else if(element>64  && element < 91){
      encrytped_ascii.add(((element + shift - 65) % 26) + 65)
    }
    else{
      encrytped_ascii.add(element)  
    }
  }
  );
  encryptedText = String.fromCharCodes(encrytped_ascii);
  return encryptedText;
}