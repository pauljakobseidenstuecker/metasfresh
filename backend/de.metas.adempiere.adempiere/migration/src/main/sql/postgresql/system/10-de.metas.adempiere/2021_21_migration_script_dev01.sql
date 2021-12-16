-- 2021-12-16T07:24:08.393Z
-- URL zum Konzept
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,580396,0,TO_TIMESTAMP('2021-12-16 08:24:03','YYYY-MM-DD HH24:MI:SS'),100,'Produkt, Leistung, Artikel','U','Bezeichnet eine Einheit, die in dieser Organisation gekauft oder verkauft wird.','Y','Produkt_OLD','Produkt_OLD',TO_TIMESTAMP('2021-12-16 08:24:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2021-12-16T07:24:08.398Z
-- URL zum Konzept
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, CommitWarning,Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy,IsActive) SELECT l.AD_Language, t.AD_Element_ID, t.CommitWarning,t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy,'Y' FROM AD_Language l, AD_Element t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' OR l.IsBaseLanguage='Y') AND t.AD_Element_ID=580396 AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 2021-12-16T07:39:26.387Z
-- URL zum Konzept
DELETE FROM  AD_Element_Trl WHERE AD_Element_ID=580396
;

-- 2021-12-16T07:39:26.390Z
-- URL zum Konzept
DELETE FROM AD_Element WHERE AD_Element_ID=580396
;

-- 2021-12-16T07:42:32.002Z
-- URL zum Konzept
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,580398,0,TO_TIMESTAMP('2021-12-16 08:42:26','YYYY-MM-DD HH24:MI:SS'),100,'Verwalten von Produkten','U','Das Fenster "Produkt" definiert alle Produkte, die von einer Organisation verwendet werden. Dies schliesst die ein, die an Kunden verkauft werden und solche, die von Lieferanten eingekauft werden.','Y','Produkt_the_OLD','Produkt_the_OLD',TO_TIMESTAMP('2021-12-16 08:42:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2021-12-16T07:42:32.003Z
-- URL zum Konzept
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, CommitWarning,Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy,IsActive) SELECT l.AD_Language, t.AD_Element_ID, t.CommitWarning,t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy,'Y' FROM AD_Language l, AD_Element t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y' OR l.IsBaseLanguage='Y') AND t.AD_Element_ID=580398 AND NOT EXISTS (SELECT 1 FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 2021-12-16T07:47:30.121Z
-- URL zum Konzept
UPDATE AD_Window SET AD_Element_ID=580398, Description='Verwalten von Produkten', Help='Das Fenster "Produkt" definiert alle Produkte, die von einer Organisation verwendet werden. Dies schliesst die ein, die an Kunden verkauft werden und solche, die von Lieferanten eingekauft werden.', Name='Produkt_the_OLD',Updated=TO_TIMESTAMP('2021-12-16 08:47:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=140
;

-- 2021-12-16T07:47:30.129Z
-- URL zum Konzept
UPDATE AD_Menu SET Description='Verwalten von Produkten', IsActive='Y', Name='Produkt_the_OLD',Updated=TO_TIMESTAMP('2021-12-16 08:47:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=126
;

-- 2021-12-16T07:47:30.132Z
-- URL zum Konzept
UPDATE AD_Menu SET Description='Verwalten von Produkten', IsActive='Y', Name='Produkt_the_OLD',Updated=TO_TIMESTAMP('2021-12-16 08:47:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=1000034
;

-- 2021-12-16T07:47:30.140Z
-- URL zum Konzept
UPDATE AD_WF_Node SET Description='Verwalten von Produkten', Help='Das Fenster "Produkt" definiert alle Produkte, die von einer Organisation verwendet werden. Dies schliesst die ein, die an Kunden verkauft werden und solche, die von Lieferanten eingekauft werden.', Name='Produkt_the_OLD',Updated=TO_TIMESTAMP('2021-12-16 08:47:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_WF_Node_ID=161
;

-- 2021-12-16T07:47:30.166Z
-- URL zum Konzept
/* DDL */  select update_window_translation_from_ad_element(580398) 
;

-- 2021-12-16T07:47:30.171Z
-- URL zum Konzept
DELETE FROM AD_Element_Link WHERE AD_Window_ID=140
;

-- 2021-12-16T07:47:30.183Z
-- URL zum Konzept
/* DDL */ select AD_Element_Link_Create_Missing_Window(140)
;

-- 2021-12-16T07:49:11.127Z
-- URL zum Konzept
UPDATE AD_Window SET AD_Element_ID=574080, Description='Verwalten von Produkten', Help='Das Fenster "Produkt" definiert alle Produkte, die von einer Organisation verwendet werden. Dies schliesst die ein, die an Kunden verkauft werden und solche, die von Lieferanten eingekauft werden.', Name='Produkt',Updated=TO_TIMESTAMP('2021-12-16 08:49:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=541375
;

-- 2021-12-16T07:49:11.130Z
-- URL zum Konzept
UPDATE AD_Menu SET Description='Verwalten von Produkten', IsActive='Y', Name='Produkt',Updated=TO_TIMESTAMP('2021-12-16 08:49:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=541880
;

-- 2021-12-16T07:49:11.134Z
-- URL zum Konzept
/* DDL */  select update_window_translation_from_ad_element(574080) 
;

-- 2021-12-16T07:49:11.138Z
-- URL zum Konzept
DELETE FROM AD_Element_Link WHERE AD_Window_ID=541375
;

-- 2021-12-16T07:49:11.139Z
-- URL zum Konzept
/* DDL */ select AD_Element_Link_Create_Missing_Window(541375)
;

-- 2021-12-16T07:52:56.623Z
-- URL zum Konzept
UPDATE AD_Menu SET AD_Element_ID=580398, Description='Verwalten von Produkten', Name='Produkt_the_OLD', WEBUI_NameBrowse=NULL, WEBUI_NameNew=NULL, WEBUI_NameNewBreadcrumb=NULL,Updated=TO_TIMESTAMP('2021-12-16 08:52:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=126
;

-- 2021-12-16T07:52:56.625Z
-- URL zum Konzept
/* DDL */  select update_menu_translation_from_ad_element(580398) 
;

-- 2021-12-16T08:04:42.597Z
-- URL zum Konzept
UPDATE AD_Menu SET AD_Element_ID=580398, Description='Verwalten von Produkten', Name='Produkt_the_OLD', WEBUI_NameBrowse=NULL, WEBUI_NameNew=NULL, WEBUI_NameNewBreadcrumb=NULL,Updated=TO_TIMESTAMP('2021-12-16 09:04:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=1000034
;

-- 2021-12-16T08:04:42.598Z
-- URL zum Konzept
/* DDL */  select update_menu_translation_from_ad_element(580398) 
;

-- 2021-12-16T08:13:30.670Z
-- URL zum Konzept
UPDATE AD_Window SET IsOverrideInMenu='Y',Updated=TO_TIMESTAMP('2021-12-16 09:13:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=541375
;

-- 2021-12-16T08:24:55.884Z
-- URL zum Konzept
INSERT INTO AD_Menu (Action,AD_Client_ID,AD_Element_ID,AD_Menu_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,Description,EntityType,InternalName,IsActive,IsCreateNew,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy) VALUES ('W',0,574080,541882,0,541375,TO_TIMESTAMP('2021-12-16 09:24:50','YYYY-MM-DD HH24:MI:SS'),100,'Verwalten von Produkten','D','541375_Product','Y','N','N','N','N','Produkt',TO_TIMESTAMP('2021-12-16 09:24:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2021-12-16T08:24:55.890Z
-- URL zum Konzept
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy,IsActive) SELECT l.AD_Language, t.AD_Menu_ID, t.Description,t.Name,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy,'Y' FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y') AND t.AD_Menu_ID=541882 AND NOT EXISTS (SELECT 1 FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 2021-12-16T08:24:55.905Z
-- URL zum Konzept
INSERT  INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID,0, 'Y', now(), 100, now(), 100,t.AD_Tree_ID, 541882, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.AD_Table_ID=116 AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=541882)
;

-- 2021-12-16T08:24:55.917Z
-- URL zum Konzept
/* DDL */  select update_menu_translation_from_ad_element(574080) 
;

-- 2021-12-16T08:24:56.023Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541584 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.027Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540905 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.028Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540814 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.029Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541297 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.029Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540803 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.030Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541377 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.030Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=6, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540904 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.031Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=7, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540749 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.035Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=8, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540779 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.035Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=9, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540910 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.036Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=10, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541308 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.037Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=11, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541313 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.038Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=12, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540758 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.038Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=13, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540759 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.039Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=14, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540806 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.040Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=15, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540891 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.041Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=16, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540896 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.042Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=17, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540903 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.042Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=18, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541405 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.044Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=19, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540906 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.044Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=20, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541455 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.045Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=21, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541710 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.045Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=22, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541717 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.046Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=23, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541454 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.046Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=24, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540907 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.047Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=25, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540908 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.048Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=26, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541015 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.048Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=27, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541016 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.049Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=28, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541042 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.049Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=29, Updated=now(), UpdatedBy=100 WHERE  Node_ID=315 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.050Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=30, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541368 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.051Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=31, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541120 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.051Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=32, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541125 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.051Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=33, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000056 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.052Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=34, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541304 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.053Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=35, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000064 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.053Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=36, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000072 AND AD_Tree_ID=10
;

-- 2021-12-16T08:24:56.054Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000015, SeqNo=37, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541882 AND AD_Tree_ID=10
;

-- 2021-12-16T08:27:47.179Z
-- URL zum Konzept
UPDATE AD_Window SET IsOverrideInMenu='N',Updated=TO_TIMESTAMP('2021-12-16 09:27:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=541375
;

-- 2021-12-16T08:33:10.332Z
-- URL zum Konzept
DELETE FROM  AD_Menu_Trl WHERE AD_Menu_ID=541882
;

-- 2021-12-16T08:33:10.342Z
-- URL zum Konzept
DELETE FROM AD_Menu WHERE AD_Menu_ID=541882
;

-- 2021-12-16T08:33:10.343Z
-- URL zum Konzept
DELETE FROM AD_TreeNodeMM n WHERE Node_ID=541882 AND EXISTS (SELECT * FROM AD_Tree t WHERE t.AD_Tree_ID=n.AD_Tree_ID AND t.AD_Table_ID=116)
;

-- 2021-12-16T08:38:52.515Z
-- URL zum Konzept
INSERT INTO AD_Menu (Action,AD_Client_ID,AD_Element_ID,AD_Menu_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,Description,EntityType,InternalName,IsActive,IsCreateNew,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy) VALUES ('W',0,574080,541883,0,541375,TO_TIMESTAMP('2021-12-16 09:38:47','YYYY-MM-DD HH24:MI:SS'),100,'Verwalten von Produkten','D','product-new (541375)','Y','N','N','N','N','Produkt',TO_TIMESTAMP('2021-12-16 09:38:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2021-12-16T08:38:52.518Z
-- URL zum Konzept
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy,IsActive) SELECT l.AD_Language, t.AD_Menu_ID, t.Description,t.Name,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy,'Y' FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y'AND (l.IsSystemLanguage='Y') AND t.AD_Menu_ID=541883 AND NOT EXISTS (SELECT 1 FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 2021-12-16T08:38:52.521Z
-- URL zum Konzept
INSERT  INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID,0, 'Y', now(), 100, now(), 100,t.AD_Tree_ID, 541883, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.AD_Table_ID=116 AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=541883)
;

-- 2021-12-16T08:38:52.524Z
-- URL zum Konzept
/* DDL */  select update_menu_translation_from_ad_element(574080) 
;

-- 2021-12-16T08:38:52.586Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541735 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.587Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541293 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.588Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000034 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.589Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541391 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.590Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541468 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.591Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000092 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.592Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=6, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541376 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.592Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=7, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000093 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.593Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=8, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541230 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.594Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=9, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541062 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.595Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=10, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541115 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.595Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=11, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541116 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.596Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=12, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541126 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.597Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=13, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541127 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.597Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=14, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541194 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.598Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=15, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541411 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.599Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=16, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000044 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.600Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=17, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000035 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.601Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=18, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000037 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:52.602Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=19, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541883 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.614Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541735 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.614Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541293 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.615Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000034 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.615Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541883 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.616Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541391 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.617Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541468 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.617Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=6, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000092 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.618Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=7, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541376 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.618Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=8, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000093 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.619Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=9, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541230 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.619Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=10, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541062 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.620Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=11, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541115 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.620Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=12, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541116 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.621Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=13, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541126 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.621Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=14, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541127 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.621Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=15, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541194 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.622Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=16, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541411 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.622Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=17, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000044 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.623Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=18, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000035 AND AD_Tree_ID=10
;

-- 2021-12-16T08:38:59.623Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=19, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000037 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.454Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541735 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.454Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541293 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.455Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541883 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.456Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000034 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.456Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541391 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.457Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541468 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.457Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=6, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000092 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.458Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=7, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541376 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.459Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=8, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000093 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.459Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=9, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541230 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.460Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=10, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541062 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.461Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=11, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541115 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.461Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=12, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541116 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.462Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=13, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541126 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.463Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=14, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541127 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.463Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=15, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541194 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.464Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=16, Updated=now(), UpdatedBy=100 WHERE  Node_ID=541411 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.465Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=17, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000044 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.465Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=18, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000035 AND AD_Tree_ID=10
;

-- 2021-12-16T08:39:18.466Z
-- URL zum Konzept
UPDATE AD_TreeNodeMM SET Parent_ID=1000009, SeqNo=19, Updated=now(), UpdatedBy=100 WHERE  Node_ID=1000037 AND AD_Tree_ID=10
;

-- 2021-12-16T08:41:52.103Z
-- URL zum Konzept
UPDATE AD_Menu SET IsCreateNew='Y',Updated=TO_TIMESTAMP('2021-12-16 09:41:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=541883
;

