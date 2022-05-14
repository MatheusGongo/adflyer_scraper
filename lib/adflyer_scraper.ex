defmodule AdflyerScraper do
  # enables Hound helpers inside our module, e.g. navigate_to/1
  use Hound.Helpers

  def fetch_ip do

    counter = 0
    for i <- 0..1000 do
      Hound.start_session(
          additional_capabilities: %{
            chromeOptions: %{ "args" => [
                "--user-agent=#{Hound.Browser.user_agent(:chrome)}",
                "--headless",
                "--disable-gpu"
            ]}
          }
      )
      IO.inspect("Começou a Sessao de numero:#{i+1}")
      navigate_to "http://localhost:4000"
      timer_entry = Enum.random(2800..4000)
      :timer.sleep(timer_entry)
      type_addons = Enum.random(0..1)
      case(type_addons) do
        0 ->
          click_ad()
        1 ->
          click_shorty_link()
          IO.inspect("Encerrou Shorty Link")
      end
      :timer.sleep(2000)
      Hound.end_session()
      IO.inspect("Fim posicao #{i+1}")
      counter = i+1
    end
    IO.inspect "Finalizou tudo!!! Total: #{counter}"
  end

  def click_shorty_link do
      type_links = Enum.random(0..3)
      timer_entry = Enum.random(2000..4000)
      :timer.sleep(timer_entry)
      case(type_links)do
        0 -> navigate_to "http://usheethe.com/P5sK"
            find_element(:id, "skip_bu2tton")
            |> attribute_value("href")
            |> navigate_to

        1 -> navigate_to "http://usheethe.com/26575457/deviantart"
            find_element(:id, "skip_bu2tton")
            |> attribute_value("href")
            |> navigate_to

        2 -> navigate_to "http://usheethe.com/Q6aG"
            find_element(:id, "skip_bu2tton")
            |> attribute_value("href")
            |> navigate_to

        3 -> navigate_to "http://usheethe.com/Q6ax"
            find_element(:id, "skip_bu2tton")
            |> attribute_value("href")
            |> navigate_to
      end
      :timer.sleep(timer_entry)
    end

  def click_ad do
    find_element(:id, "ad")
    |> click()
    true
  end

end
