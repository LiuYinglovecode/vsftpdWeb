CREATE DATABASE vsftpd;
USE vsftpd;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `perm` varchar(50) NOT NULL DEFAULT '0',
  `path` varchar(50) NOT NULL DEFAULT 'none',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

CREATE TABLE IF NOT EXISTS `settings` (
  `id` tinyint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `defval` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

INSERT INTO `settings` (`id`, `name`, `value`, `defval`) VALUES
(1, 'admin', PASSWORD('UPDATE_THIS_UNSAFE'), 'admin'),
(8, 'log_path', '/dev/stdout', 'log_path'),
(3, 'site_url', '', ''),
(4, 'user_path', '/ftp/', ''),
(5, 'disk1', '/ftp/', 'BIG1'),
(6, 'disk2', '/ftp/', 'BIG2'),
(7, 'disk3', '/ftp/', 'root'),
(9, 'mail_server', 'mail.mail.com', ''),
(10, 'mail_port', '25', '25'),
(11, 'mail_user', 'ftp@mail.com', ''),
(12, 'mail_password', 'UPDATE_THIS_UNSAFE', ''),
(13, 'mail_from', 'FTP Report', ''); 

CREATE USER 'vsftpd'@'HOSTFILTER' IDENTIFIED BY 'UPDATE_THIS_UNSAFE';
GRANT ALL privileges ON vsftpd.* TO 'vsftpd'@'HOSTFILTER' IDENTIFIED BY 'UPDATE_THIS_UNSAFE';
CREATE USER 'vsftpdweb'@'HOSTFILTER' IDENTIFIED BY 'UPDATE_THIS_UNSAFE';
GRANT ALL privileges ON vsftpd.* TO 'vsftpdweb'@'HOSTFILTER' IDENTIFIED BY 'UPDATE_THIS_UNSAFE';
FLUSH PRIVILEGES;
