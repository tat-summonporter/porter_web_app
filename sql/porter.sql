CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `countryId` smallint(5) unsigned NOT NULL,
  `regionId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `countryId` (`countryId`),
  KEY `regionId` (`regionId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `countries` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortName` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `customerLoginActivity` (
  `customerId` int(10) unsigned NOT NULL,
  `activityEpoch` bigint(14) unsigned NOT NULL,
  `activity` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) unsigned NOT NULL,
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customerId`,`activityEpoch`),
  KEY `success` (`success`),
  KEY `success_2` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest` tinyint(1) unsigned NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissionsGroup` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobilePhone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homePhone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cityId` int(10) unsigned DEFAULT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mailing` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `signupEpoch` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityId` (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discountCityBlacklist` (
  `discountId` int(10) unsigned NOT NULL,
  `cityId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discountId`,`cityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discountCountryBlacklist` (
  `discountId` int(10) unsigned NOT NULL,
  `countryId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discountId`,`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discountRegionBlacklist` (
  `discountId` int(10) unsigned NOT NULL,
  `regionId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discountId`,`regionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discountServiceWhitelist` (
  `discountId` int(10) unsigned NOT NULL,
  `serviceId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discountId`,`serviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdEpoch` int(11) unsigned NOT NULL,
  `startEpoch` int(11) unsigned NOT NULL,
  `endEpoch` int(11) unsigned NOT NULL,
  `discount` smallint(5) unsigned NOT NULL,
  `discountType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `startEpoch` (`startEpoch`),
  KEY `endEpoch` (`endEpoch`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `internalLoginActivity` (
  `internalUserId` int(10) unsigned NOT NULL,
  `activityEpoch` bigint(14) unsigned NOT NULL,
  `activity` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) unsigned NOT NULL,
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`internalUserId`,`activityEpoch`),
  KEY `success` (`success`),
  KEY `success_2` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `internalUsers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwordSalt` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionsGroup` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `partialRequests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(10) unsigned NOT NULL,
  `serviceId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `serviceId` (`serviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porterAssignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `porterId` int(10) unsigned NOT NULL,
  `requestId` int(10) unsigned NOT NULL,
  `assignmentEpoch` bigint(14) unsigned NOT NULL,
  `assignmentOperator` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requestId` (`requestId`),
  KEY `porterId` (`porterId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porterRequestActivity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `porterId` int(10) unsigned NOT NULL,
  `requestId` int(10) unsigned NOT NULL,
  `activityDateTime` datetime NOT NULL,
  `activity` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `porterId` (`porterId`),
  KEY `requestId` (`requestId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porterServiceInterestGrades` (
  `porterId` int(10) unsigned NOT NULL,
  `serviceId` int(10) unsigned NOT NULL,
  `interestGrade` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`porterId`,`serviceId`),
  KEY `interestGrade` (`interestGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porterVehicleAccess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `porterId` int(10) unsigned NOT NULL,
  `vehicleType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idToken` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` date DEFAULT NULL,
  `mobilePhone` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homePhone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mailing` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cityId` int(10) unsigned NOT NULL,
  `backgroundRef` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signupEpoch` int(11) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idToken` (`idToken`),
  KEY `cityId` (`cityId`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryId` smallint(5) unsigned NOT NULL,
  `requestTax` float(16,10) unsigned NOT NULL,
  `porterTax` float(16,10) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countryId` (`countryId`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `requestAddresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requestId` int(10) unsigned NOT NULL,
  `cityId` int(10) unsigned NOT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailing` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stepping` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order` (`stepping`),
  KEY `cityId` (`cityId`),
  KEY `requestId` (`requestId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idToken` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serviceId` int(10) unsigned NOT NULL,
  `discountId` int(10) unsigned DEFAULT NULL,
  `portersWanted` smallint(5) unsigned NOT NULL,
  `requestState` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerId` int(10) unsigned NOT NULL,
  `porterStartDateTime` datetime DEFAULT NULL,
  `porterEndDateTime` datetime DEFAULT NULL,
  `billingSubtotal` float(16,10) unsigned DEFAULT NULL,
  `billingService` float(16,10) unsigned DEFAULT NULL,
  `billingDiscount` float(16,10) unsigned DEFAULT NULL,
  `billingTaxes` float(16,10) unsigned DEFAULT NULL,
  `billingTrustFee` float(16,10) unsigned DEFAULT NULL,
  `billingTotal` float(16,10) unsigned DEFAULT NULL,
  `authCode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transCode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transDateTime` datetime DEFAULT NULL,
  `lastCardDigits` smallint(4) unsigned DEFAULT NULL,
  `requestEpoch` int(11) unsigned NOT NULL,
  `requestStartDateTime` datetime NOT NULL,
  `estDuration` smallint(5) unsigned NOT NULL,
  `details` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idToken` (`idToken`),
  KEY `requestState` (`requestState`),
  KEY `requestStartEpoch` (`requestStartDateTime`),
  KEY `serviceId` (`serviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `serviceGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webImage` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appImage` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressCount` smallint(3) unsigned NOT NULL,
  `feeRate` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` float(16,10) unsigned NOT NULL,
  `baseFee` float(16,10) unsigned NOT NULL,
  `pay` float(16,10) unsigned NOT NULL,
  `trustFee` float(16,10) unsigned DEFAULT NULL,
  `defaultEstDuration` int(8) unsigned NOT NULL,
  `webHeader` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webMobileHeader` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webIcon` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appImage` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupId` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `groupId` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
