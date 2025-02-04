
    CALL apoc.periodic.iterate(
        "LOAD CSV WITH HEADERS FROM 'file:////Users/ermiyasggod/Desktop/BioCypher/biocypher-kg/output/experimental_factor_ontology/edges_efo_subclass_of_efo_efo.csv' AS row FIELDTERMINATOR '|' RETURN row",
        "MATCH (source:efo {id: row.source_id})
        MATCH (target:efo {id: row.target_id})
        MERGE (source)-[r:efo_subclass_of]->(target)
        SET r += apoc.map.removeKeys(row, ['source_id', 'target_id', 'label', 'source_type', 'target_type'])",
        {batchSize:1000}
    )
    YIELD batches, total
    RETURN batches, total;
            