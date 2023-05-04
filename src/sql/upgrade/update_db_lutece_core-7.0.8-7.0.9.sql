ALTER TABLE core_feature_group ADD COLUMN feature_group_icon VARCHAR(255) DEFAULT NULL;
DELETE FROM `core_feature_group` WHERE `id_feature_group`='CONTENT';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('CONTENT', 'portal.features.group.content.description', 'portal.features.group.content.label', 1, 'ti ti-files');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='APPLICATIONS';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('APPLICATIONS', 'portal.features.group.applications.description', 'portal.features.group.applications.label', 3, 'ti ti-apps');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='SYSTEM';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('SYSTEM', 'portal.features.group.system.description', 'portal.features.group.system.label', 7, 'ti ti-shield-lock ');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='SITE';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('SITE', 'portal.features.group.site.description', 'portal.features.group.site.label', 2, 'ti ti-world');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='STYLE';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('STYLE', 'portal.features.group.charter.description', 'portal.features.group.charter.label', 6, 'ti ti-brush');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='USERS';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('USERS', 'portal.features.group.users.description', 'portal.features.group.users.label', 4, 'ti ti-users');
DELETE FROM `core_feature_group` WHERE `id_feature_group`='MANAGERS';
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`, `feature_group_icon`) VALUES ('MANAGERS', 'portal.features.group.managers.description', 'portal.features.group.managers.label', 5, 'ti ti-user-shield');

DELETE FROM `core_stylesheet` WHERE `id_stylesheet` IN ( 213, 279 );
INSERT INTO `core_stylesheet` VALUES (213,'Main Menu','menu_main.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n    <xsl:param name=\"site-path\" select=\"site-path\" />\r\n    <xsl:template match=\"menu-list\">\r\n        <xsl:apply-templates select=\"menu\" />\r\n    </xsl:template>\r\n    <xsl:template match=\"menu\">\r\n        <li class=\"nav-item\">\r\n            <a href=\"{$site-path}?page_id={page-id}\" class=\"nav-link\" target=\"_top\">\r\n                <xsl:value-of select=\"page-name\" />\r\n            </a>\r\n        </li>\r\n    </xsl:template>\r\n</xsl:stylesheet>');
INSERT INTO `core_stylesheet` VALUES (279,'Plan du Site module d\'Administration','admin_site_map_admin.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n    <xsl:param name=\"site-path\" select=\"site-path\" />\r\n    <xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n    <xsl:template match=\"page[page-level=0]\">\r\n        <div id=\"lutece-map-tree\" class=\"lutece-tree\">\r\n            <ul>\r\n                <li class=\"lutece-tree-node\" data-tree-icon=\"home\">\r\n                    <xsl:value-of select=\"page-name\" />\r\n                    <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                        <strong>\r\n                            <xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                            <xsl:value-of select=\"page-role\" />\r\n                        </strong>\r\n                    </xsl:if>\r\n                    <a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\"><span class=\"ti ti-link\"></span></a>\r\n                    <ul>\r\n                        <xsl:apply-templates select=\"child-pages-list\" />\r\n                    </ul>\r\n                </li>\r\n            </ul>\r\n        </div>\r\n    </xsl:template>\r\n    <xsl:template match=\"page[page-level>0]\">\r\n        <xsl:variable name=\"index\" select=\"page-id\" />\r\n        <xsl:variable name=\"description\" select=\"page-description\" />\r\n        <xsl:choose>\r\n            <xsl:when test=\"count(child-pages-list/*)>0\">\r\n            <li id=\"node-{$index}\" class=\"lutece-tree-node\" data-tree-icon=\"folder\">\r\n                <xsl:value-of select=\"page-name\" />\r\n                <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                    <strong>\r\n                        <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                        <xsl:value-of select=\"page-role\" />\r\n                    </strong>\r\n                </xsl:if>\r\n                <a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\"><span class=\"ti ti-link\"></span></a>\r\n                <ul>\r\n                    <xsl:apply-templates select=\"child-pages-list\" />\r\n                </ul>\r\n                </li>   \r\n            </xsl:when>\r\n            <xsl:otherwise>\r\n            <li id=\"node-{$index}\" class=\"lutece-tree-item\" data-tree-icon=\"file\">\r\n                <xsl:value-of select=\"page-name\" />\r\n                <xsl:if test=\"not(string(page-role)=\'none\')\">\r\n                    <strong>\r\n                        <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n                        <xsl:value-of select=\"page-role\" />\r\n                    </strong>\r\n                </xsl:if>\r\n                <a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\"><span class=\"ti ti-link\"></span></a>\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n            </li>    \r\n            </xsl:otherwise>\r\n        </xsl:choose>\r\n    </xsl:template>\r\n    <xsl:template match=\"child-pages-list\">\r\n        <xsl:apply-templates select=\"page\" />\r\n    </xsl:template>\r\n</xsl:stylesheet>');
DELETE FROM `core_page_template` WHERE `id_template`=7;
INSERT INTO `core_page_template` (`description`, `file_name`, `picture`) VALUES ('Page d\'accueil - Demo', 'skin/site/page_home_demo.html', 'lutece_logo.png');
UPDATE `core_page` SET `id_template`='7' WHERE  `id_page`=1;