#!/bin/bash

yq eval-all '(
        select(fi == 0).components.schemas
        ) as $schemas
        | (
          select(fi == 1).components.schemas
        ) as $new_schemas
        | select(fi == 0)
        | .components.schemas = $new_schemas *n $schemas
        ' file1.yaml generated.yaml >output.yaml
