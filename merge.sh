#!/bin/bash

yq eval-all '(
        select(fi == 0).components.schemas
        ) as $schemas
        | (
          select(fi == 1).components.schemas
        ) as $new_schemas
        | select(fi == 0)
        | .components.schemas = $new_schemas *n $schemas
        | .components.schemas += {
              "Activity": {
                "x-is-generated": true,
                "$ref": "#/components/schemas/RestActivity"
              }
          }
        ' file1.yaml generated.yaml >output.yaml

# yq e '.components.schemas.* |= . + {"x-is-generated": true}' file1.yaml >output.yaml
