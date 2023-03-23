import sys
from bs4 import BeautifulSoup
from selenium import webdriver

class exercise:
    def __init__(self, name, difficulty, link):
        self.name = name
        self.difficulty = difficulty
        self.link = link
    def __str__(self):
        form = "- [{name} ({difficulty})]({link})"
        return form.format(name=self.name, difficulty=self.difficulty, link=self.link)


def main(track):
    # print("not implemented yet")
    firefoxOption = webdriver.FirefoxOptions()
    firefoxOption.add_argument('-headless')
    # firefoxOption.set_headless()
    driver = webdriver.Firefox(options=firefoxOption)
    #try, catch would be good for handling invalid tracknames
    urlForm = "https://exercism.org/tracks/{t}/exercises"
    driver.get(urlForm.format(t=track))
    exerciseList = []

    content = driver.page_source
    soup = BeautifulSoup(content, features="lxml")

    anchors = soup.find_all("a", {"class": "c-exercise-widget"})
    for a in anchors:
        # print(type(a))
        link = "https://exercism.org" + a['href']
        title = a.find("div", {"class": "--title"}).string
        difficultyTag = a.find("div", {"class": "c-difficulty-tag"})
        # print(difficultyTag)
        if difficultyTag == None:
            difficulty = "None"
        elif "--easy" in difficultyTag.get("class"):
            difficulty = "Easy"
        elif "--medium" in difficultyTag.attrs["class"]:
            difficulty = "Medium"
        elif "--hard" in difficultyTag.attrs["class"]:
            difficulty = "Hard"
        else:
            difficulty = "None"
        # difficulty = a.find("div", {"class": "c-difficulty-tag"}).string
        exer = exercise(title, difficulty, link)
        exerciseList.append(exer)


    
    
    #write results to file
    # f = open("out.md", "w")
    print("# Exercism Exercises in " + track + "\n")
    print("## Exercise List\n")
    print("### Completed")
    print("### Not Completed")
    for ex in exerciseList:
        # f.write(str(ex) + "\n")
        print(str(ex))
    # f.close()

    driver.quit()



#Nested in two divs
# First class="c-results-zone"
# second class="exercises grid-cols-1 md:grid-cols-2"
# exercise information stored in <a> on exercism
# <a> contains href to relevant exercise
# class = "c-exercise-widget --available --interactive"
    #more info stored in nested <div>
    # class = "--info"
        #title located in class="--title"
        #difficulty in <div> with class "c-exercise-status-tag --available --small"


if len(sys.argv) < 2:
    print("track must be provided")
    print("python exerciseLister <track>")
    exit(1)
trackStr = sys.argv[1]
main(trackStr)