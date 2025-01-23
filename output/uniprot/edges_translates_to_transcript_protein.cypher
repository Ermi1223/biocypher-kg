
    CALL apoc.periodic.iterate(
        "LOAD CSV WITH HEADERS FROM 'file:////Users/ermiyasggod/Desktop/BioCypher/biocypher-kg/output/uniprot/edges_translates_to_transcript_protein.csv' AS row FIELDTERMINATOR '|' RETURN row",
        "MATCH (source:transcript {id: row.source_id})
        MATCH (target:protein {id: row.target_id})
        MERGE (source)-[r:translates_to]->(target)
        SET r += apoc.map.removeKeys(row, ['source_id', 'target_id', 'label', 'source_type', 'target_type'])",
        {batchSize:1000}
    )
    YIELD batches, total
    RETURN batches, total;
            