<?

$camurl="http://127.0.0.1:8080/";

$boundary="\n--";

$f = fopen($camurl,"r") ;

   if(!$f)
   {
        //**** cannot open
   }
    else
  {
        //**** URL OK
         while (substr_count($r,"Content-Length") != 2) $r.=fread($f,512);

         $start = strpos($r,"\xff");
         $end   = strpos($r,$boundary,$start)-1;
         $frame = substr("$r",$start,$end - $start);

         header("Content-type: image/jpeg");
         echo $frame;
   }

fclose($f);

?>

