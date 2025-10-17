from app import add

def test_add():
    assert add(3, 4) == 7

def test_add_negative():
    assert add(-1, -1) == -2
