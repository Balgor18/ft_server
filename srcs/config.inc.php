<?php

$cfg['blowfish_secret'] = 'abcdefghijklmnopqrstuvwxyz0123456789';

$i = 0;

$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['user'] = 'root';
#$cfg['Servers'][$i]['password'] = 'bonjour';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;

?>
