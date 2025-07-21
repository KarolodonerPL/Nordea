*** Variables ***
#Filter
${HPfilter}      xpath=//*[@aria-label="Zastosuj filtr HP, aby zawęzić wyniki"]
${Filter}        xpath=//*[@id="p_36/range-slider_slider-item"]
${MinimalPrice}  xpath=//*[@aria-label="Cena minimalna"]
${MaximalPrice}  xpath=//*[@aria-label="Cena maksymalna"]
${SearchButtonFilter}  xpath=//*[@id="a-autoid-26"]
${HPActiveFilter}    xpath=//*[@aria-label="Usuń filtr HP, aby rozwinąć wyniki"]
${HPCheckCheckBox}   xpath=//*[@aria-label="Usuń filtr HP, aby rozwinąć wyniki"]/div//span

#Object
${ProductName}     //*[@data-index="4"]//a/h2/span
${ProductPrice}    //*[@data-index="4"]//a/span/span[2]
${ProductAddButton}    xpath=//*[@data-index="4"]//button
${ProductAdded}       xpath=//*[@id="ewc-content"]