# Lab 8 — Natural Language Processing with spaCy

**Author:** Rabbi Muhammad Aman · **Course:** RIS330 (Fall 2025)

## Objective

An interactive Python program that runs the core NLP pipeline on user input and prints formatted tables.

## Pipeline output

![Tokenization](images/image1.jpeg)
*Tokenization*

![Sentence detection](images/image2.jpeg)
*Sentence detection*

![Stop-word removal](images/image3.jpeg)
*Stop-word removal*

![Linguistic annotation](images/image4.jpeg)
*Linguistic annotation*

![Part-of-speech tagging](images/image5.jpeg)
*Part-of-speech tagging*

![Dependency parsing](images/image6.jpeg)
*Dependency parsing*

![Lemmatization](images/image7.jpeg)
*Lemmatization*

![Named entity recognition](images/image8.jpeg)
*Named entity recognition*

Source code: [`nlp_spacy_program.py`](nlp_spacy_program.py)

```bash
pip install spacy tabulate
python -m spacy download en_core_web_sm
python nlp_spacy_program.py
```

## Key takeaways

- NLP is used in security for phishing detection, log triage and threat-intel extraction (NER for IPs, organizations, malware names).
