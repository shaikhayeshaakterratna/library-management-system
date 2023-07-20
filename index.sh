books=()
 
clear
echo "Welcome to the Library Management System!"
sleep 2
printf '\n\n'
 
add_book() {
  echo "Enter the book category:"
  read category
 
  echo "Enter the title of the book:"
  read title
 
  echo "Enter the author name:"
  read author
 
  echo "Confirmation: Add the following book?"
  echo "Category: $category"
  echo "Title: $title"
  echo "Author: $author"
  echo "1. Yes"
  echo "2. No"
  read confirm
 
  if [ $confirm -eq 1 ]; then
    books+=("$category, $title, $author")
    echo "Book added successfully!"
  else
    echo "Book not added."
  fi
}
 
search_book() {
  echo "Enter book title, category or author name:"
  read search_title
 
  found=0
  for book in "${books[@]}"; do
    if [[ $book == *"$search_title"* ]]; then
      echo "Book found: $book"
      found=1
      break
    fi
  done
 
  if [ $found -eq 0 ]; then
    echo "Apologize, book not found."
  fi
}
 
remove_book() {
  echo "Available books:"
  for book in "${books[@]}"; do
    echo "$book"
  done
 
  echo "Enter the book title, category or author name:"
  read remove_title
 
  found=0
  for i in "${!books[@]}"; do
    if [[ ${books[i]} == *"$remove_title"* ]]; then
      unset 'books[i]'
      echo "The book has been removed."
      found=1
      break
    fi
  done
 
  if [ $found -eq 0 ]; then
    echo "Apologize, no book found."
  fi
}
 
display_books() {
  echo "List of books:"
  for book in "${books[@]}"; do
    echo "$book"
  done
}
 
update_book() {
  echo "Available books:"
  for book in "${books[@]}"; do
    echo "$book"
  done
 
  echo "Enter the book title, category or author name for modification:"
  read update_title
 
  found=0
  for i in "${!books[@]}"; do
    if [[ ${books[i]} == *"$update_title"* ]]; then
      unset 'books[i]'
      echo "Enter new book details:"
      add_book
      found=1
      break
    fi
  done
 
  if [ $found -eq 0 ]; then
    echo "Apologize, no book found for update."
  fi
}
 
while true; do
  echo "Select an option:"
  echo "1. Add new book"
  echo "2. Search Book"
  echo "3. Remove Book"
  echo "4. Display Book List"
  echo "5. Update Book"
  echo "6. Quit Process"
 
  read option
 
  case $option in
    1)
      add_book
      ;;
    2)
      search_book
      ;;
    3)
      remove_book
      ;;
    4)
      display_books
      ;;
    5)
      update_book
      ;;
    6)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
 
  echo
done
