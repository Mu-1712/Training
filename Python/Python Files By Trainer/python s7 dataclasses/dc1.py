#----------------------------------------------------------------------------
##writing data classes are easy
#----------------------------------------------------------------------------
##init repr eq are added autmatic
#----------------------------------------------------------------------------
##@dataclass : decorator must be used
#----------------------------------------------------------------------------
##it eliminates boiler plate code
#----------------------------------------------------------------------------
# special methods like .__init__(), .__repr__(), and .__eq__() are added 
# automatically.
#----------------------------------------------------------------------------
##eq ne lt gt ge le are added automatically
#----------------------------------------------------------------------------
##after creation it acts as a normal class
#----------------------------------------------------------------------------
##usefull to write robust,small classes storing data
#----------------------------------------------------------------------------
##by default, data classes can be compared for equality
#----------------------------------------------------------------------------
##if order=true, classes can also be sorted
#----------------------------------------------------------------------------
##the sorting happens on the field values
#----------------------------------------------------------------------------
##no base classes or meta classes are used
----------------------------------------------------------------------------
##You can, for instance, inherit from a data class in the normal way. 
#----------------------------------------------------------------------------
##The main purpose of data classes is to make it quick and easy to write robust classes, in particular small classes that mainly store data.
#----------------------------------------------------------------------------
from dataclasses import dataclass, field

@dataclass(order=True)
class Country:
#----------------------------------------------------------------------------
    name: str
    population: int
    area: float = field(repr=False, compare=False)
    coastline: float = 0
#----------------------------------------------------------------------------
    def beach_per_person(self):
        """Meters of coastline per person"""
        return (self.coastline * 1000) / self.population
#----------------------------------------------------------------------------
norway = Country("Norway", 5320045, 323802, 58133)
print(norway)
#----------------------------------------------------------------------------
##Country(name='Norway', population=5320045, coastline=58133)
#----------------------------------------------------------------------------
print(norway.area)
#----------------------------------------------------------------------------
##323802
#----------------------------------------------------------------------------
usa = Country("United States", 326625791, 9833517, 19924)
nepal = Country("Nepal", 29384297, 147181)
print(usa)
print(nepal)
#----------------------------------------------------------------------------
##Country(name='United States', population=326625791, coastline=19924)
##Country(name='Nepal', population=29384297, coastline=0)
#----------------------------------------------------------------------------
print(usa.beach_per_person())
#----------------------------------------------------------------------------
##0.06099946957342386
#----------------------------------------------------------------------------
print(norway.area)
#----------------------------------------------------------------------------
#323802
#----------------------------------------------------------------------------
print(norway == norway)
#----------------------------------------------------------------------------
##True
#----------------------------------------------------------------------------
print(nepal == usa)
#----------------------------------------------------------------------------
#False
#----------------------------------------------------------------------------
print(sorted((norway, usa, nepal)))
#----------------------------------------------------------------------------
##[Country(name='Nepal', population=29384297, coastline=0), Country(name='Norway', population=5320045, coastline=58133), Country(name='United States', population=326625791, coastline=19924)]
##
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
##= RESTART: C:\Users\dhanp\OneDrive\python\python\python\python s7 dataclasses\dc1.py
##Country(name='Norway', population=5320045, coastline=58133)
##323802
##Country(name='United States', population=326625791, coastline=19924)
##Country(name='Nepal', population=29384297, coastline=0)
##0.06099946957342386
##323802
##True
##False
##[Country(name='Nepal', population=29384297, coastline=0), Country(name='Norway', population=5320045, coastline=58133), Country(name='United States', population=326625791, coastline=19924)]
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

