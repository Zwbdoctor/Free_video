from haystack import indexes
from .models import VideoResource


class VideoResourceIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return VideoResource

    def index_queryset(self, using=None):
         # a = self.get_model()
         return   self.get_model().vr_m.all()