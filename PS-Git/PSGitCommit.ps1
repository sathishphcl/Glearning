function psgitcommit {

  param(
    [String[]] $message
  )
    
  If(!$message){
 
    $TimeStamp = get-date -f "ddMMyyyy_hhmm"
    $mes = "Auto update: $TimeStamp"
  }
  
  git add .
  git commit -a -m "$message"
  git push
}

cd "C:\Git\inventory"
Psgitcommit -message "Done for today"

#Or without a message, so it will add the timestamp.

Psgitcommit