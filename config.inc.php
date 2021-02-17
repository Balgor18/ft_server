<?php

$cfg['blowfish_secret'] = 'abcdefghijklmnopqrstuvwxyz0123456789'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

$i = 0;

$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
