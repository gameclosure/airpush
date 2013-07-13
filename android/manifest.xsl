<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">

	<xsl:param name="airpushAppID" />
	<xsl:param name="airpushAPIKey" />
	<xsl:param name="airpushPackage" />

	<xsl:output indent="yes" />
	<xsl:template match="comment()" />

	<xsl:template match="meta-data[@android:name='COM.PACKAGE.APPID']">
		<meta-data android:name="COM.PACKAGE.APPID" android:value="{$airpushAppID}">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.APPID')" />
			</xsl:attribute>
		</meta-data>
	</xsl:template>

	<xsl:template match="meta-data[@android:name='COM.PACKAGE.APIKEY']">
		<meta-data android:name="COM.PACKAGE.APIKEY" android:value="android*{$airpushAPIKey}">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.APIKEY')" />
			</xsl:attribute>
		</meta-data>
	</xsl:template>

	<xsl:template match="activity[@android:name='COM.PACKAGE.SmartWallActivity']">
		<activity android:exported="false" android:name="COM.PACKAGE.SmartWallActivity"
			android:configChanges="orientation|screenSize"
			android:theme="@android:style/Theme.Translucent">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.SmartWallActivity')" />
			</xsl:attribute>
		</activity>
	</xsl:template>

	<xsl:template match="activity[@android:name='COM.PACKAGE.BrowserActivity']">
		<activity android:name="COM.PACKAGE.BrowserActivity"
			android:configChanges="orientation|screenSize">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.BrowserActivity')" />
			</xsl:attribute>
		</activity>
	</xsl:template>

	<xsl:template match="service[@android:name='COM.PACKAGE.PushService']">
		<service android:name="COM.PACKAGE.PushService" android:exported="false">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.PushService')" />
			</xsl:attribute>
		</service>
	</xsl:template>

	<xsl:template match="receiver[@android:name='COM.PACKAGE.BootReceiver']">
		<receiver android:name="COM.PACKAGE.BootReceiver" android:exported="false" >
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($airpushPackage,'.BootReceiver')" />
			</xsl:attribute>
			<intent-filter>
				<action android:name="android.intent.action.BOOT_COMPLETED" />
				<category android:name="android.intent.category.HOME" />
			</intent-filter>
		</receiver>
	</xsl:template>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
