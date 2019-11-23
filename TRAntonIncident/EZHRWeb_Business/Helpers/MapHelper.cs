using AutoMapper;
using EZHRWeb_Business.Models;
using EZHRWeb_DB.Models;


namespace EZHRWeb_Business.Helpers
{
    public class MapHelper
    {

        public static IMapper SetupMaps()
        {

            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<DMaker, DMakerDto>();
                cfg.CreateMap<DMakerDto, DMaker>();

                cfg.CreateMap<SampleCallFlowDto, SampleCallFlow>();
                cfg.CreateMap<SampleCallFlow, SampleCallFlowDto>();

                cfg.CreateMap<QMasterDto, QMaster>();
                cfg.CreateMap<QMaster, QMasterDto>();

                cfg.CreateMap<ReportDataDto, ReportData>();
                cfg.CreateMap<ReportData, ReportDataDto>();

                cfg.CreateMap<WebPhraseDto, WebPhrase>();
                cfg.CreateMap<WebPhrase, WebPhraseDto>();

                cfg.CreateMap<RespDataDto, RespData>();
                cfg.CreateMap<RespData, RespDataDto>();

            });

            return new Mapper(config);
        }
    }
}

