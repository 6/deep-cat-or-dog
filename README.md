# deep-cat-or-dog

use deep learning (tensorflow) to answer the question, "Cat or Dog?"

### using the classifier

try it out with example images that weren't in the training set:

```
python label_image.py example/cat1.jpg
cat (score = 0.99855)
dog (score = 0.00145)

python label_image.py example/dog1.jpg
dog (score = 0.98780)
cat (score = 0.01220)
```

### training the model yourself (optional)

- download  `train.zip` from https://www.kaggle.com/c/dogs-vs-cats/data
- unzip that into `/train/` folder in this directory
- follow instructions from https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#1

On `3. Retrieving the images`, rather than downloading the flowers dataset, run `ruby sort-dataset.rb` to sort the cat/dog dataset into the tensorflow retrain.py's expected folder structure.

Also, replace the following command:

```
docker run -it -v $HOME/tf_files:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

with:

```
docker run -it -v /path/to/deep-cat-or-dog:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

Finally, on `4. (Re)training Inception`, replace

```
--image_dir /tf_files/flower_photos
```

with:

```
--image_dir /tf_files/tf_train
```

### optimizing the model (optional)

This step makes classification faster but potentially lower accuracy:

```
# In Docker:
python /tensorflow/tensorflow/python/tools/optimize_for_inference.py \
  --input=/tf_files/retrained_graph.pb \
  --output=/tf_files/optimized_graph.pb \
  --input_names='DecodeJpeg/contents:0' \
  --output_names=final_result

python /tensorflow/tensorflow/tools/quantization/quantize_graph.py \
  --input=/tf_files/optimized_graph.pb
  --output=/tf_files/quantized_graph.pb
  --output_node_names=final_result
  --mode=weights_rounded
```

Finally, use bazel to run memory mapping ([why?](https://petewarden.com/2016/09/27/tensorflow-for-mobile-poets/)):

```
# In Docker:
cd /tensorflow
bazel build tensorflow/contrib/util:convert_graphdef_memmapped_format
bazel-bin/tensorflow/contrib/util/convert_graphdef_memmapped_format \
  --in_graph=/tf_files/quantized_graph.pb \
  --out_graph=/tf_files/memmapped_graph.pb
```

Note: you may have to append `--local_resources 256,2.0,1.0` to the bazel build command to get it to work within Docker.
