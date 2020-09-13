<?php

  function jsonEncodePrivate($obj){
    // export the variable to find the privates
    $exp = var_export($obj, true);
    // get rid of the __set_state that only works 5.1+
    $exp = preg_replace('/[a-z0-9_]+\:\:__set_state\(/i','((object)', $exp);
    /// rebuild the object
    eval('$enc = json_encode('.$exp.');');
    // return the encoded value
    return $enc;
  }

?>
