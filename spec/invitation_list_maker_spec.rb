require './spec/spec_helper'

RSpec.describe InvitationListMaker do
  it 'has method .matched_customers' do
    # expect(InvitationListMaker).to respond_to(:matched_customers)
  end
  
  it 'does not return customers which are too far' do
    # expect
  end
  
end

# расчет расстояний
#   перевод в радианы верный
# формула работает -
#   верные ответы для тестового примера
#   для одинаковых координат 0
#
# чтение из файла работает
#
# вывод правильно сформирован по виду
# фильтр по расстоянию работает верно
