
    CALL apoc.periodic.iterate(
        "LOAD CSV WITH HEADERS FROM 'file:////Users/ermiyasggod/Desktop/BioCypher/biocypher-kg/output/reactome/edges_genes_pathways_gene_pathway.csv' AS row FIELDTERMINATOR '|' RETURN row",
        "MATCH (source:gene {id: row.source_id})
        MATCH (target:pathway {id: row.target_id})
        MERGE (source)-[r:genes_pathways]->(target)
        SET r += apoc.map.removeKeys(row, ['source_id', 'target_id', 'label', 'source_type', 'target_type'])",
        {batchSize:1000}
    )
    YIELD batches, total
    RETURN batches, total;
            