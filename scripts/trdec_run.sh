#!/bin/bash

export PYTHONPATH="$(pwd)"
export CUDA_VISIBLE_DEVICES="0"

python3.6 src/main.py \
  --trdec \
  --output_dir="outputs_trdec" \
  --log_every=10 \
  --eval_every=500 \
  --reset_output_dir \
  --d_word_vec=512 \
  --d_model=512 \
  --data_path="data/orm_data/" \
  --target_tree_vocab="vocab.rule.eng" \
  --target_word_vocab="vocab.word.eng" \
  --target_tree_train="set0-trainunfilt.tok.parse.eng" \
  --target_tree_valid="set0-dev.tok.parse.eng" \
  --target_tree_test="set0-test.tok.parse.eng" \
  --source_train="set0-trainunfilt.tok.piece.orm" \
  --target_train="set0-trainunfilt.tok.piece.eng" \
  --source_valid="set0-dev.tok.piece.orm" \
  --target_valid="set0-dev.tok.piece.eng" \
  --source_vocab="vocab.orm" \
  --source_test="set0-test.tok.piece.orm" \
  --target_test="set0-test.tok.piece.eng" \
  --batch_size=16 \
  --n_train_sents=200000 \
  --max_len=2000 \
  --n_train_steps=5000 \
  --cuda \
  "$@"
