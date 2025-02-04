
    CALL apoc.periodic.iterate(
        "LOAD CSV WITH HEADERS FROM 'file:////Users/ermiyasggod/Desktop/BioCypher/biocypher-kg/output/gene_ontology/molecular_function/edges_molecular_function_subclass_of_molecular_function_molecular_function.csv' AS row FIELDTERMINATOR '|' RETURN row",
        "MATCH (source:molecular_function {id: row.source_id})
        MATCH (target:molecular_function {id: row.target_id})
        MERGE (source)-[r:molecular_function_subclass_of]->(target)
        SET r += apoc.map.removeKeys(row, ['source_id', 'target_id', 'label', 'source_type', 'target_type'])",
        {batchSize:1000}
    )
    YIELD batches, total
    RETURN batches, total;
            