# Import all required libraries.
#spacy will work for NLP processing.
#tabulate for nicely formatted tables.
import spacy
from tabulate import tabulate

def main():
    #loadinng the English spacy model.
    nlp = spacy.load("en_core_web_sm")
    dash()  #print separate line for decoration
    print("Welcome to a NLP programe made with Python using Spacy library.")
    dash()
    # receiving text input from user with error handling
    while True:
        try:
            text = input("Write your text bellow to process different NLP operation: \n")
        except EOFError:
            dash()
            print("You did not input any text. Input something.")
            dash()
            continue
        if text.strip() == "":
            dash()
            print("You did not input any text. Input something.")
            dash()
            continue
        else:
            break

    dash()
    #process the text with spacy
    doc = nlp(text)
    #program loop- it will run untill user exit
    while True:
        user_interface()        #it will display menu options
        user_input = input("Option(1 - 9): ")   #user will choose processing option
        dash()
        #match the choice with operations
        if user_input == "1":
            print("Printing all tokens:\n")    
             #calling tokenization function
            tokenization(doc)
            dash()
        elif user_input == "2":
            print("Printing Lingustic Annotations:\n")  
            #calling annotation function
            linguistical_annotation(doc)
            dash()
        elif user_input == "3":
            print("Printing lemmatization of all tokens:\n") 
            #calling lemmatization function
            lemmatization(doc)
            dash()
        elif user_input == "4":
            print("Detecting sentences in the given string and printing:\n") 
             #sentence detection function
            sentence_detection(doc)
            dash()
        elif user_input == "5":
            print("Printing POS, Tag and Explanation of all tokens:\n")    
             #POS + detailed tags
            pos_tagging(doc)
            dash()
        elif user_input == "6":
            print("Printing Named Entity Recognitions:\n")
            ner(doc)    #named entity recognition
            dash()
        elif user_input == "7":
            print("Detecting the stop words from the given string and removing them:\n")
            #remove stop words
            remove_stop_words(doc)
            dash()
        elif user_input == "8":
            print("Dependency Relationships:\n")
            #dependency parsing
            dependency_parsing(doc)
            dash()
        elif user_input == "9":
            print("Thank you for using the program. Goodbye!")
            dash()
            break
        else:
            print("INVALID INPUT! TRY AGAIN.")
            dash()

def user_interface():
    #displaying menu items for user selection
    print("Chose the operation you wanna process:\n")
    print("1. Tokenization")
    print("2. Linguistical annotation")
    print("3. Lemmatization")
    print("4. Sentence detection")
    print("5. POS tagging")
    print("6. Named Entity Recognition (NER)")
    print("7. Stop words removal")
    print("8. Dependency parsing")
    print("9. Exit the program")
    dash()

def tokenization(doc):
    #printing each token with index number
    for index, token in enumerate(doc, start=1):
        print(f"Token {index}: {token}")

def linguistical_annotation(doc):
    #creating a list of dictionary to store key value pair
    data = []
    for token in doc:
        data.append({"Token": token.text, "POS": token.pos_, "Lemma": token.lemma_, "Dependency": token.dep_, "Entity": token.ent_type_})
#printing collected data in table format
    print(tabulate(data, headers="keys", tablefmt="pipe"))

def lemmatization(doc):
    data = []
    for index, token in enumerate(doc, start=1):
        data.append({"Token": token.text, "Lemma": token.lemma_})
#display table
    print(tabulate(data, headers="keys", tablefmt="pipe"))

def sentence_detection(doc):
    #loop over detected sentences
    for index, sent in enumerate(doc.sents, start=1):
        print(f"{index}: {sent}")

def pos_tagging(doc):
    data = []
    for token in doc:
        #store POS information
        data.append({"Token": token.text, "POS": token.pos_, "Tag": token.tag_, "Detail": spacy.explain(token.tag_)})
    #print the table
    print(tabulate(data, headers="keys", tablefmt="pipe"))

def ner(doc):
    data = []
    #for each entity found in text
    for ent in doc.ents:
        data.append({"Entity": ent.text, "Type": ent.label_})

    print(tabulate(data, headers="keys", tablefmt="pipe"))

def remove_stop_words(doc):
    #create s list of tokens that are not stop words
    filtered_tokens = [token.text for token in doc if not token.is_stop]
    #it will join the remaining words back into a string
    filtered_sent = " ".join(filtered_tokens)
    print(f"Text after stop word removal: {filtered_sent}")

def dependency_parsing(doc):
    data = []
    for token in doc:
        #collecting dependency parsing info
        data.append({"TOKEN": token.text, "DEP": token.dep_, "HEAD": token.head, "POS": token.pos_})
   
    print(tabulate(data, headers="keys", tablefmt="pipe"))

def dash():
    #printing a line of "=" characters for separation
    print("=" * 100)

#this is the entry point. It only runs when file is executed directly
if __name__ == "__main__":
    main()
