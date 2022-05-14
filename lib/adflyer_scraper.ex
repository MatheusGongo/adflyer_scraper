defmodule AdflyerScraper do
  # enables Hound helpers inside our module, e.g. navigate_to/1
  use Hound.Helpers

  def fetch_ip do

    money = 0

    for i <- 0..10 do
      Hound.start_session
      IO.inspect("Começou a Sessao de numero:#{i+1}")
      navigate_to "http://localhost:4000"
      :timer.sleep(5000)
      click_ad()
      :timer.sleep(3000)
      :timer.sleep(3000)
      Hound.end_session()
      IO.inspect("Encerrou a Sessao de numero:#{i+1}")
      money = money + 0.0030
    end
  end

  def click_shorty_link do
    navigate_to "https://www58.freddyoctavio.pro/pushredirect/?network=6&site=adfly&ppi=26580429&pci=7080354157&t=1652532520&dest=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dep42yVAKbm0"
  end

  def click_ad do
    find_element(:id, "ad")
    |> click()
    true
  end

end
