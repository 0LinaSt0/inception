<?php

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~MY_CUSTOM_COMMENT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ To change defineds: write information about created database(DB_NAME),         ~
  ~ about created superuser in database(DB_USER), his password(DB_PASSWORD),       ~
  ~ about actual name of host (DB_HOST). In the same time, for privasy, we         ~
  ~ should add random secret-keys (AUTH_KEY, SECURE_AUTH_KEY, ..., NONCE_SALT).    ~
  ~ Random keys could be created on https://api.wordpress.org/secret-key/1.1/salt/ ~
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'my_database' );

/** Database username */
define( 'DB_USER', 'msalena' );

/** Database password */
define( 'DB_PASSWORD', 'mdbpasswd' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '#r?#2J r1P!|+PD?G65$-SI++sZOm]DVU;XNp5~4YG:GG)|+A>$h|gi&33?($uW4');
define( 'SECURE_AUTH_KEY',  'SwA*.[,Lj/XHz30athgfrMwr=qAo>pGwZ_;$;(PTvBtN<`&{/0/Wl_yf?uW.^Y08');
define( 'LOGGED_IN_KEY',    'l>B~_J+ic:`&yY+VGPI3+syz+PL#cO#gfwc,nc48kwHBh;^^C+MnU69RJP_<u!P,');
define( 'NONCE_KEY',        '/j47t&Ai+Hd)$OgL3)E)G[KFHpad_8DXX+5|IKIYUex,a<t<[d-4$&571:+iFaFC');
define( 'AUTH_SALT',        '{wht]D7k#v*M2O?RJmgaD2qg0ya<}:6VUMeUPE!%L[Eb:[e6,n=$L*0-+G)*/A{6');
define( 'SECURE_AUTH_SALT', 'SwAwSo98!.P6|AY1aiG+7?S5R-GO&wT6}tC%WIvjbyugIKczHi!!f,|N?[U4Im|{');
define( 'LOGGED_IN_SALT',   '^dFohWtv18(]HRkTR$D}=6j}.q4?4pmJsvKn-h<4uUnS<eKc04B{+?+*J<1b~3Qz');
define( 'NONCE_SALT',       'MS],y<]oz=>%OfwIT9fs|Ah/$UflK8LuH Hj`}%=V|t8]0Knjl|H]8$Ruz++x|#1');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';