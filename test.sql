SELECT l.ID,l.heading,l.synopsis,l.publishDate,l.datein,l.catID, l.authorID,l.domainID,l.viewed,l.flags,l.extra, o.category, o.cat_labelClass, o.cat_url, o.author_name, (SELECT GROUP_CONCAT(publication SEPARATOR ', ') FROM lin_publications INNER JOIN lin_article_pub ON lin_article_pub.pubID = lin_publications.ID WHERE lin_article_pub.artID = l.ID) AS publication, l.thumbnail,  l.ID AS ID FROM (SELECT lin_articles.ID, lin_articles_categories.category, lin_articles_categories.labelClass as cat_labelClass, lin_articles_categories.url as cat_url,  lin_authors.name as author_name FROM ((((lin_article_pub INNER JOIN lin_articles ON lin_article_pub.artID = lin_articles.ID) INNER JOIN lin_domain_pub ON lin_article_pub.pubID = lin_domain_pub.pID) INNER JOIN lin_articles_categories ON lin_articles.catID = lin_articles_categories.ID) LEFT JOIN lin_authors ON lin_articles.authorID = lin_authors.ID) WHERE lin_domain_pub.domainID='1' 

GROUP BY lin_articles.ID 
ORDER BY publishDate DESC, ID DESC 
LIMIT 0,2 
) o JOIN lin_articles l ON l.ID = o.ID 
