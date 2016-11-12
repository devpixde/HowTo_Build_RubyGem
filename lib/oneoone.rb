module OneOOne

  class Exercise

    # constructor
    def initialize
      @counter = 0
      @points = 0
    end

    # startup
    def run
      intro
      question
    end

    # show intro
    def intro
      puts "\n------ Das kleine Ein mal Eins -----------\n\n"
      puts "Mit diesem kleinen Programm kannst du das Ein mal Eins üben.\n"
      puts "Füp jede richtig gelöste Aufgabe bekommst du 100 Punkte. \nWenn du eine Aufgabe falsch machst werden dir 50 Punkte abgezogen.\n"
      puts "\nSagst du mir deinen Namen? \nTipp deinen Namen jetzt ein und Drücke danach die Enter-Taste."
      @name = gets.chomp!
      puts "Hallo, #{@name}! \nWenn du anfangen möchtest drücke nochmal die Enter-Taste."
      gets
      question
    end

    # show question
    def question
      @counter = @counter + 1
      puts "---------------\nAufgabe #{@counter}:\n----------------"
      a = rand(0..10)
      b = rand(0..10)
      puts "#{a} * #{b} = ?"
      answer = gets.chomp!
      evaluate a, b, answer
    end


    # evaluate answer
    def evaluate a, b, answer
      if is_integer? answer && answer.to_i == a * b
        @points = @points + 100
        puts "Super, das stimmt: #{a} * #{b} = #{answer}  \nDu hast #{@points} Punkte."
      else
        @points = @points - 50 unless @points == 0
        puts "Nö, das war leider nicht richtig.\nRichtig wäre #{a*b}\nDu hast #{@points} Punkte."
      end

      puts "Drücke eine Taste, um weiter zu machen oder die Leertaste wenn du aufhören willst.\n"
      key = gets.chomp!
      if key == ' '
        finish
      else
        question
      end
    end

    # finish exercise
    def finish
      puts "\n\n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-\n\n"
      puts "Prima, #{@name}, du hast die Übung mit #{@points} Punkten beendet. Weiter so!"
      puts "\n-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
      exit
    end

    # helper
    def is_integer? str
      str.to_i.to_s == str
    end
  end
end

OneOOne::Exercise.new.run